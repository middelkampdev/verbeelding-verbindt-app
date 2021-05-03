import 'dart:async';

import 'package:verbeelding_verbindt_core/entities/speciality.dart';
import 'package:verbeelding_verbindt_core/services/speciality_service.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'select_interests_state.dart';

class SelectInterestsCubit extends CubitBase<SelectInterestsState> {
  SelectInterestsCubit({
    required SpecialityService specialityService,
  })   : _specialityService = specialityService,
        super(SelectInterestsState.initialize()) {
    _init();
  }

  final SpecialityService _specialityService;

  late StreamSubscription _specialitiesStreamSub;

  void _init() {
    _specialitiesStreamSub =
        _specialityService.getSpecialities().listen(_loadSpecialities);
  }

  void _loadSpecialities(
    List<SpecialityEntity> specialities,
  ) {
    emit(SelectInterestsState.load(specialities));
  }

  void toggleSpeciality(
    String? specialityId,
  ) {
    if (specialityId == null) {
      return;
    }
    final selectedIds = state.selectedSpecialityIds.toList();
    final index = selectedIds.indexOf(specialityId);
    if (index > -1) {
      selectedIds.removeAt(index);
    } else {
      selectedIds.add(specialityId);
    }
    emit(state.copyWith(
      selectedSpecialityIds: selectedIds,
    ));
  }

  void toggleSelectionConfirmation() {
    emit(state.copyWith(
      selectionConfirmed: !state.selectionConfirmed,
    ));
  }

  @override
  Future<void> close() {
    _specialitiesStreamSub.cancel();
    return super.close();
  }
}
