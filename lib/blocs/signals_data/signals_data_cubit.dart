import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sailing_rules/blocs/signals_selection/signals_selection_cubit.dart';

import 'package:sailing_rules/models/signals_data_model.dart';
import 'package:sailing_rules/repositories/signals_repository.dart';

part 'signals_data_state.dart';

class SignalsDataCubit extends Cubit<SignalsDataState> {
  late final StreamSubscription signalsSelectionCubitSubscription;
  final SignalsSelectionCubit signalsSelectionCubit;
  final SignalsRepository signalsRepository;

  SignalsDataCubit({
    required this.signalsRepository,
    required this.signalsSelectionCubit,
  }) : super(InitialSignalsDataState()) {
    signalsSelectionCubitSubscription = signalsSelectionCubit.stream.listen(
      (SignalsSelectionState signalsSelectionState) {
        getSignalsDataResults();
      },
    );
    getSignalsDataResults();
  }

  void getSignalsDataResults() async {
    debugPrint(
        'in SginalsDataCubit: signalsSelectionCubit.state.signalsSelectionChoice.name: ${signalsSelectionCubit.state.signalsSelectionChoice.name}');
    try {
      emit(
        LoadingSignalsDataState(),
      );
      if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'postponement') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/postponement_signals.json', 'PostponementSignals');
        debugPrint('in signals_data_cubit: postponement');
        emit(LoadedSignalsDataState(signalsResultDataList));
      } else if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'abandonment') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/abandonment_signals.json', 'AbandonmentSignals');
        debugPrint('in signals_data_cubit: abandonment');
        emit(LoadedSignalsDataState(signalsResultDataList));
      } else if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'preparatory') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/preparatory_signals.json', 'PreparatorySignals');
        debugPrint('in signals_data_cubit: preparatory');
        emit(LoadedSignalsDataState(signalsResultDataList));
      } else if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'recall') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/recall_signals.json', 'RecallSignals');
        debugPrint('in signals_data_cubit: recall');
        emit(LoadedSignalsDataState(signalsResultDataList));
      } else if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'changingNextLeg') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/changing_next_leg.json', 'ChangingNextLegSignals');
        debugPrint('in signals_data_cubit: changingNextLeg');
        emit(LoadedSignalsDataState(signalsResultDataList));
      } else if (signalsSelectionCubit.state.signalsSelectionChoice.name == 'other') {
        final signalsResultDataList = await signalsRepository.getSignalsData(
            'lib/assets/json_data_files/other_signals.json', 'OtherSignals');
        debugPrint('in signals_data_cubit: other');
        emit(LoadedSignalsDataState(signalsResultDataList));
      }
    } catch (e) {
      debugPrint('Error is: $e');
      rethrow;
    }
  }

  @override
  Future<void> close() {
    signalsSelectionCubitSubscription.cancel();
    return super.close();
  }
}
