import 'dart:async';
import 'dart:io';

import 'package:auth_repository/src/params/otp_verification_params.dart';
import 'package:auth_repository/src/params/signin_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_persistence/cloud_persistence.dart';
import 'package:domain_models/domain_models.dart' as dm;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    cloudPersistence: CloudPersistence(storage: null),
  ),
);

class AuthRepository {
  AuthRepository({
    required FirebaseAuth? auth,
    required FirebaseFirestore? firestore,
    required CloudPersistence? cloudPersistence,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _cloudPersistence = cloudPersistence ?? CloudPersistence(storage: null);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final CloudPersistence _cloudPersistence;

  FirebaseAuth get auth => _auth;

  Future<dm.User?> getCurrentUser() async {
    final response =
        await _firestore.collection('users').doc(_auth.currentUser?.uid).get();
    dm.User? user;
    if (response.data() != null) {
      user = dm.User.fromMap(response.data()!);
    }
    return user;
  }

  Future<void> phoneSignin(
    String phone, {
    required SigninParams signinParams,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: signinParams.verificationCompleted,
        verificationFailed: signinParams.verificationFailed,
        codeSent: signinParams.codeSent,
        codeAutoRetrievalTimeout: signinParams.codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyOTP({
    required OTPVerificationParams otpVerificationParams,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: otpVerificationParams.verificationId,
        smsCode: otpVerificationParams.otp,
      );
      await _auth.signInWithCredential(credential);
      otpVerificationParams.onOTPVerified();
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserInfo({
    required String name,
    required File? profile,
  }) async {
    try {
      final uid = _auth.currentUser!.uid;
      var photoURL = defaultPhotoURL;
      if (profile != null) {
        photoURL = await _cloudPersistence.saveFile(
          ref: 'profile_pic/$uid',
          file: profile,
        );
      }

      final user = dm.User(
        name: name,
        uid: uid,
        phone: _auth.currentUser!.phoneNumber,
        profile: photoURL,
        isOnline: true,
        groupIDs: [],
      );

      await saveToFirestore(user);
    } catch (e) {
      rethrow;
    }
  }
}

extension on AuthRepository {
  Future<void> saveToFirestore(dm.User user) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(user.toMap());
  }

  String get defaultPhotoURL =>
      'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';
}
