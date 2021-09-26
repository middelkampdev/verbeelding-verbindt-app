import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../repositories/auth_repository.dart';
import '../use_case_base.dart';

class SignInAnonymouslyUseCase extends UseCase<void, void> {
  SignInAnonymouslyUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> call(
    void argument,
  ) async {
    final user = await _authRepository.signInAnonymously();
    // TODO: add into loggin repo
    FirebaseCrashlytics.instance.setUserIdentifier(user.id);
  }
}