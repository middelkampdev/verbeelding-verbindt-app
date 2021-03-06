import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../verbeelding_verbindt_core.dart';

class SignInAnonymouslyUseCase extends UseCase<Future<void>, void> {
  SignInAnonymouslyUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Future<void> call(
    void params,
  ) async {
    final user = await _authRepository.signInAnonymously();
    // TODO: add into loggin repo
    FirebaseCrashlytics.instance.setUserIdentifier(user.id);
  }
}
