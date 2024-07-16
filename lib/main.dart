import 'dart:developer';

import 'package:auth/auth.dart';
import 'package:components/components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landing/landing.dart';
import 'package:nav/nav.dart';
import 'package:whatsapp_ui/firebase_options.dart';
import 'package:whatsapp_ui/router.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _lightTheme = LightNexusThemeData();
  final _darkTheme = DarkNexusThemeData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userAuthProvider);
    return NexusTheme(
      light: _lightTheme,
      dark: _darkTheme,
      child: Navigation(
        routes: Routes(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whatsapp UI',
          localizationsDelegates: const [
            LandingLocalizations.delegate,
            AuthLocalizations.delegate,
          ],
          theme: _darkTheme.materialThemeData,
          // initialRoute: userProvider.when(data: data, error: error, loading: loading),
          onGenerateRoute: Nav.onGenerateRoute,
          home: userProvider.when(
            data: (user) {
              if (user == null) {
                return const LandingScreen();
              }
              return const MobileLayoutScreen();
            },
            error: (err, trace) {
              log('$err', stackTrace: trace, name: '$MyApp');
              return ExceptionIndicator(
                error: '$err',
              );
            },
            loading: () {
              return const Center(child: Loader());
            },
          ),
        ),
      ),
    );
  }
}

// TODO(albanybuipe): 2:40:50
