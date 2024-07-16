import 'package:auth/auth.dart';
import 'package:auth/src/otp/otp_controller.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

class OtpScreen extends ConsumerWidget {
  static const String route = '/otp-screen';

  const OtpScreen({
    required this.verificationId,
    super.key,
  });

  final String verificationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(otpControllerProvider);
    final size = MediaQuery.of(context).size;
    final l10n = AuthLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.numberVerificationTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.micro),
        child: Column(
          children: [
            Center(
              child: Text(
                l10n.otpPromptMessage,
                style: const TextStyle(fontSize: Dimens.macro),
              ),
            ),
            const SizedBox(height: Dimens.macro),
            SizedBox(
              width: size.width * .5,
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: l10n.otpHint,
                    hintStyle: const TextStyle(
                      fontSize: Dimens.extraLarge,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 6) {
                      controller.verifyOtp(
                        verificationId: verificationId,
                        otp: value.trim(),
                        onVerified: () {
                          Navigation.of(context).toUserInfo();
                        },
                        onError: (error) => showSnackBar(
                          content: error,
                          context: context,
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
