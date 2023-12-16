
part of 'signals_selection_cubit.dart';

enum SignalsSelectionChoice {
  postponement,
  abandonment,
  preparatory,
  recall,
  changingNextLeg,
  other,
}

class SignalsSelectionState extends Equatable {
  final SignalsSelectionChoice signalsSelectionChoice;

 const SignalsSelectionState({
    this.signalsSelectionChoice = SignalsSelectionChoice.postponement,
  });

  factory SignalsSelectionState.initial(){
    return const SignalsSelectionState();
  }

  @override
  List<Object> get props => [signalsSelectionChoice];

  @override
  String toString() => 'SignalsSelectionState(signalsSelectionChoice: $signalsSelectionChoice)';

  SignalsSelectionState copyWith({
    SignalsSelectionChoice? signalsSelectionChoice,
  }) {
    return SignalsSelectionState(
      signalsSelectionChoice: signalsSelectionChoice ?? this.signalsSelectionChoice,
    );
  }
}
