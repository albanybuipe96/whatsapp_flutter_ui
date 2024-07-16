import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpControllerProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return OtpController(repository: repository);
});

class OtpController {
  const OtpController({required AuthRepository repository})
      : _repository = repository;

  final AuthRepository _repository;

  void verifyOtp({
    required String verificationId,
    required String otp,
    required VoidCallback onVerified,
    Function(String value)? onError,
  }) async {
    try {
      await _repository.verifyOTP(
        otpVerificationParams: OTPVerificationParams(
          verificationId: verificationId,
          otp: otp,
          onOTPVerified: onVerified,
        ),
      );
    } catch (e) {
      log('$e', name: '$OtpController');
      onError != null ? onError('$e') : null;
    }
  }
}
