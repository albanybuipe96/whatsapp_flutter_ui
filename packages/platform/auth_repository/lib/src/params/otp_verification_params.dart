import 'package:flutter/material.dart';

class OTPVerificationParams {
  OTPVerificationParams({
    required this.verificationId,
    required this.otp,
    required this.onOTPVerified,
  });

  String verificationId;
  String otp;
  VoidCallback onOTPVerified;
}
