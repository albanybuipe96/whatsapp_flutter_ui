import 'dart:developer';
import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoControllerProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return UserInfoController(repository: repository);
});

class UserInfoController {
  const UserInfoController({
    required AuthRepository repository,
  }) : _repository = repository;
  final AuthRepository _repository;

  Future<bool> saveInfo({required String name, File? file}) async {
    try {
      await _repository.saveUserInfo(name: name, profile: file);
      return true;
    } catch (e) {
      log(e.toString(), name: '$UserInfoController');
      return false;
    }
  }
}

final userInfoNotifierProvider =
    NotifierProvider<UserInfoNotifier, UserInfo>(() => UserInfoNotifier());

class UserInfoNotifier extends Notifier<UserInfo> {
  @override
  UserInfo build() {
    return const UserInfo(name: '');
  }

  void onImagePicked(File? value) {
    state = state.copyWith(image: value);
  }

  void onNameChanged(String value) {
    state = state.copyWith(name: value);
  }
}

class UserInfo {
  const UserInfo({
    required this.name,
    this.image,
  });

  final String name;
  final File? image;

  UserInfo copyWith({
    String? name,
    File? image,
  }) {
    return UserInfo(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
