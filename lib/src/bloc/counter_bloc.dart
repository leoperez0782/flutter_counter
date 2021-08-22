
import 'package:bloc/bloc.dart';
import 'package:contador_bloc/src/bloc/Events/counter_events.dart';
import 'package:contador_bloc/src/bloc/States/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  
  int counterValue = 0;
  late int initialCounter;
  CounterBloc(CounterState initialState) : super(initialState){
    this.initialCounter = initialState.props.first as int;
  }

  @override
  CounterState get initialState => ShowCounterValue(counterValue);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
     if (event is IncrementCounterValue) {
      this.counterValue++;
      yield ShowCounterValue(counterValue);
    }

    if (event is DecrementCounterValue) {
      this.counterValue--;
      yield ShowCounterValue(counterValue);
    }

    if(event is ResetCounter){
      print('entra al bloc');
      this.counterValue = this.initialCounter;
      print(' $counterValue');
      yield ShowCounterValue(counterValue);
    }
  }
}