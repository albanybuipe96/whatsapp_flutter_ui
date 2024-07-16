import 'landing_localizations.dart';

/// The translations for English (`en`).
class LandingLocalizationsEn extends LandingLocalizations {
  LandingLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get greeting => 'WhatsApp';

  @override
  String get policyButtonLabel => 'Agree and Continue';

  @override
  String get policyMessage => 'Read our Privacy Policy. Tap \'Agree and continue\' to accept Terms of Service.';
}
