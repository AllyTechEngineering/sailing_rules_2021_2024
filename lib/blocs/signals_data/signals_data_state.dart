part of 'signals_data_cubit.dart';

abstract class SignalsDataState extends Equatable {}

class InitialSignalsDataState extends SignalsDataState {
  @override
  List<Object> get props => [];
}

class LoadingSignalsDataState extends SignalsDataState {
  @override
  List<Object> get props => [];
}

class LoadedSignalsDataState extends SignalsDataState {
  LoadedSignalsDataState(
    this.signalsData,
  );

  final List<SignalsDataModel> signalsData;

  @override
  List<Object> get props => [signalsData];

  @override
  String toString() => 'LoadedSignalsDataState(signalsData: $signalsData)';
}

class ErrorSignalsDataState extends SignalsDataState {
  @override
  List<Object> get props => [];
}
