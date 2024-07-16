import 'package:auth_repository/auth_repository.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginController(repository: repository);
});

final userAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(loginControllerProvider);
  return authController.getCurrentUser();
});

class LoginController {
  LoginController({
    required AuthRepository repository,
  }) : _repository = repository;
  final AuthRepository _repository;

  void phoneSignin({
    required String phone,
    required Function(String id, int? token) codeSent,
  }) async {
    _repository.phoneSignin(
      phone,
      signinParams: SigninParams(
        verificationCompleted: (credential) async {
          _repository.auth.signInWithCredential(credential);
        },
        verificationFailed: (exception) {
          throw exception;
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (value) {},
      ),
    );
  }

  Future<User?> getCurrentUser() async {
    final user = await _repository.getCurrentUser();

    return user;
  }
}
