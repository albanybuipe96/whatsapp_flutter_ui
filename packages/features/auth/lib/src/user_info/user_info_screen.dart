import 'dart:io';

import 'package:auth/auth.dart';
import 'package:auth/src/user_info/user_info_controller.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

class UserInfoScreen extends ConsumerWidget {
  static const route = '/user-info-screen';

  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(userInfoNotifierProvider);
    final size = MediaQuery.of(context).size;
    final l10n = AuthLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: provider.image == null
                        ? const NetworkImage(
                            'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                          )
                        : FileImage(provider.image!),
                    radius: Dimens.giga,
                  ),
                  Positioned(
                    bottom: -Dimens.tenth,
                    left: 80,
                    child: IconButton(
                      onPressed: () async {
                        final image = await _pickImage();
                        ref
                            .read(userInfoNotifierProvider.notifier)
                            .onImagePicked(image);
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: Dimens.extraLarge,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * .85,
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimens.extraLarge,
                      horizontal: Dimens.macro,
                    ),
                    child: TextField(
                      onChanged: ref
                          .read(userInfoNotifierProvider.notifier)
                          .onNameChanged,
                      decoration: InputDecoration(
                        hintText: l10n.nameHint,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await submit(provider, ref, context);
                    },
                    icon: const Icon(Icons.done),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit(
    UserInfo provider,
    WidgetRef ref,
    BuildContext context,
  ) async {
    if (provider.name.isNotEmpty) {
      bool saved = await ref
          .read(userInfoControllerProvider)
          .saveInfo(name: provider.name, file: provider.image);
      if (saved) {
        if (!context.mounted) return;
        Navigation.of(context).popUntilContactList();
      }
    } else {
      showSnackBar(
        context: context,
        content: 'Username can\'t be empty.',
      );
    }
  }

  Future<File?> _pickImage() async {
    final image = await pickImage();
    return image;
  }
}
