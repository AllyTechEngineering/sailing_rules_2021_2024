import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'signals_selection_state.dart';

class SignalsSelectionCubit extends Cubit<SignalsSelectionState> {
  SignalsSelectionCubit() : super(SignalsSelectionState.initial());

  void setSignalsSelectionChoice(String signalsSelectionChoice) {
    debugPrint(
        'in signals_selection_cubit before if: signalsSelectionChoice: $signalsSelectionChoice');
    if (signalsSelectionChoice == SignalsSelectionChoice.postponement.name) {
      debugPrint('in signals_selection_cubit if postponement: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.postponement));
    } else if (signalsSelectionChoice == SignalsSelectionChoice.abandonment.name) {
      debugPrint('in signals_selection_cubit if abandonment: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.abandonment));
    } else if (signalsSelectionChoice == SignalsSelectionChoice.preparatory.name) {
      debugPrint('in signals_selection_cubit if preparatory: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.preparatory));
    } else if (signalsSelectionChoice == SignalsSelectionChoice.recall.name) {
      debugPrint('in signals_selection_cubit if recall: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.recall));
    } else if (signalsSelectionChoice == SignalsSelectionChoice.changingNextLeg.name) {
      debugPrint('in signals_selection_cubit if changingNextLeg: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.changingNextLeg));
    } else if (signalsSelectionChoice == SignalsSelectionChoice.other.name) {
      debugPrint('in signals_selection_cubit if other: $signalsSelectionChoice');
      emit(state.copyWith(signalsSelectionChoice: SignalsSelectionChoice.other));
    } else {
      debugPrint('Something is wrong!');
    }
  }
}
