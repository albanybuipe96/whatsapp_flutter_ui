import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:landing/src/l10n/landing_localizations.dart';
import 'package:landing/src/nav.dart';
import 'package:nav/nav.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const route = '/landing-screen';

  @override
  Widget build(BuildContext context) {
    final l10n = LandingLocalizations.of(context);
    final nav = Navigation.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: context.height * .05),
              Text(
                l10n.greeting,
                style: const TextStyle(
                  fontSize: Dimens.giga,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height * .03),
              Image.asset(
                'assets/bg.png',
                package: 'landing',
                color: AppColors.tabColor,
              ),
              SizedBox(height: context.height / 9),
              Text(
                l10n.policyMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Dimens.macro,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: Dimens.micro),
              CustomButton.solid(
                text: l10n.policyButtonLabel.toUpperCase(),
                onPressed: nav.toLogin,
                width: context.width * .75,
                elevation: 5,
                style: const TextStyle(color: AppColors.black),
                backgroundColor: AppColors.tabColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
