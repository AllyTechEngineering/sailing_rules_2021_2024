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
    this.loadedSignalsData,
  );

  final List<SignalsDataModel> loadedSignalsData;

  @override
  List<Object> get props => [loadedSignalsData];

  @override
  String toString() => 'LoadedSignalsDataState(signalsData: $loadedSignalsData)';
}

class ErrorSignalsDataState extends SignalsDataState {
  @override
  List<Object> get props => [];
}
