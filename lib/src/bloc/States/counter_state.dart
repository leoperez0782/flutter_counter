import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  @override
  
  List<Object?> get props => [];

}

class ShowLoadingCounterScreen extends CounterState {}


class ShowCounterValue extends CounterState {
  @override
  List<Object> get props => [counterValue];

  final int counterValue;

  ShowCounterValue(this.counterValue);
}