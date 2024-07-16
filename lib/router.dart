import 'package:auth/auth.dart';
import 'package:components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:landing/landing.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/widgets/chat_list.dart';
import 'package:whatsapp_ui/widgets/contacts_list.dart';

abstract class Nav {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingScreen.route:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case LoginScreen.route:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case OtpScreen.route:
        assert(settings.arguments != null, 'id cannot be empty');
        final verificationId = settings.arguments! as String;
        return MaterialPageRoute(
          builder: (context) => OtpScreen(
            verificationId: verificationId,
          ),
        );
      case UserInfoScreen.route:
        return MaterialPageRoute(
          builder: (context) => const UserInfoScreen(),
        );
      case MobileChatScreen.route:
        return MaterialPageRoute(
          builder: (context) => const MobileChatScreen(),
        );

      case ChatList.route:
        return MaterialPageRoute(
          builder: (context) => const ChatList(),
        );

      case ContactsList.route:
        return MaterialPageRoute(
          builder: (context) => const ContactsList(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const ExceptionIndicator());
    }
  }
}
