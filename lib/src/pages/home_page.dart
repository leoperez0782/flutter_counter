import 'package:contador_bloc/src/bloc/Events/counter_events.dart';
import 'package:contador_bloc/src/bloc/States/counter_state.dart';
import 'package:contador_bloc/src/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {

    _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  @override
  void dispose() { 
    _counterBloc.close();
    super.dispose();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Counter App example!!!!!"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>
    (
      builder: (context, state) {
        print('build body begin');
        switch(state.runtimeType){
          case  ShowLoadingCounterScreen:
            print('Loadin screen state');
            return buildLoadingScreen();
            
          case ShowCounterValue:
            print('show counter');
            return _buildCounterScreen(state.props.first);
          default:
            return _buildCounterScreen(0);
        }
        
      }
    );

  }

  Widget buildLoadingScreen() {
    return Center(child: CircularProgressIndicator());

  }

  Widget _buildCounterScreen(Object? counterValue) {
    final int value = counterValue! as int;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pulsaste el contador :', 
        style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          value.toString(), 
          style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            (value == 1)? 'vez' : 'veces',
          style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Incrementar',
                  child: Icon(Icons.add),
                  ),
                SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: _resetCounter,
                tooltip: 'Reset',
                child: Icon(Icons.restart_alt),
              )
              ],
            ),
            )
      ],
    );
  }



  void _incrementCounter() {
    print('Incrementar!!!');
    _counterBloc.add(IncrementCounterValue());
  }

  void _decrementCounter() {
    print('Decrementar!!!');
    _counterBloc.add(DecrementCounterValue());
  }

  void _resetCounter() {
    print('Resetear!!!');
    _counterBloc.add(ResetCounter());
  }
}