import 'package:verbeelding_verbindt_core/use_cases/intro/accept_intro_use_case.dart';
import 'package:verbeelding_verbindt_core/use_cases/intro/get_is_intro_accepted_use_case.dart';
import 'package:verbeelding_verbindt_ui/shared/blocs/cubit_base.dart';

import 'intro_state.dart';

class IntroCubit extends CubitBase<IntroState> {
  IntroCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required AcceptIntroUseCase acceptIntroUseCase,
  })  : _getIsIntroAcceptedUseCase = getIsIntroAcceptedUseCase,
        _acceptIntroUseCase = acceptIntroUseCase,
        super(const IntroState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAcceptedUseCase;
  final AcceptIntroUseCase _acceptIntroUseCase;

  Future<void> init() async {
    emit(IntroState.loaded(
      accepted: await _getIsIntroAcceptedUseCase(null),
    ));
  }

  Future<void> accept() async {
    emit(IntroState.loaded(
      accepted: await _acceptIntroUseCase(null),
    ));
  }
}