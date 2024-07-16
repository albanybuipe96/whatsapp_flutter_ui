import 'package:auth/auth.dart';

import 'package:auth/src/login/login_controller.dart';
import 'package:components/components.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav/nav.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  static const route = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();

  Country? country;

  @override
  Widget build(BuildContext context) {
    final l10n = AuthLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final nav = Navigation.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.numberInputInstruction,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.macro),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(l10n.verificationMessage)),
            const SizedBox(height: Dimens.micro),
            CustomButton.text(
              onPressed: _pickCountry,
              text: l10n.pickCountryLabel,
              style: const TextStyle(color: Colors.blueAccent),
            ),
            const SizedBox(height: Dimens.nano),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (country != null) Text('+${country?.phoneCode}'),
                const SizedBox(width: Dimens.micro),
                SizedBox(
                  width: size.width * .7,
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: l10n.phoneNumberHint,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton.solid(
              onPressed: sendPhoneNumber,
              // onPressed: nav.toUserInfo,
              text: 'Next'.toUpperCase(),
              style: const TextStyle(color: Colors.black),
              backgroundColor: AppColors.tabColor,
            ),
            const SizedBox(height: Dimens.macro)
          ],
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    String number = _phoneController.text.trim();
    if (country != null && number.isNotEmpty) {
      final provider = ref.read(loginControllerProvider);
      provider.phoneSignin(
        phone: '+${country!.phoneCode}$number',
        codeSent: (String id, int? token) {
          Navigation.of(context).toOtp(id);
        },
      );
    } else {
      showSnackBar(context: context, content: 'Select country/phone number');
    }
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (country) {
        setState(() {
          this.country = country;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }
}
