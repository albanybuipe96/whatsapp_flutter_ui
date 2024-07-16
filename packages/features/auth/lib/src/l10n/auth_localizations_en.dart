import 'auth_localizations.dart';

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get numberInputInstruction => 'Enter your phone number';

  @override
  String get pickCountryLabel => 'Pick a country';

  @override
  String get verificationMessage => 'WhatsApp will need to verify your phone number';

  @override
  String get phoneNumberHint => 'phone number';

  @override
  String get numberVerificationTitle => 'Verifying your number';

  @override
  String get otpPromptMessage => 'We have sent an SMS with code';

  @override
  String get otpHint => '- - - - - -';

  @override
  String get nameHint => 'Enter your name';
}
