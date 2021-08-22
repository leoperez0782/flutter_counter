import 'package:contador_bloc/src/bloc/States/counter_state.dart';
import 'package:contador_bloc/src/bloc/counter_bloc.dart';
import 'package:contador_bloc/src/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: _buildCounterScreen(),
    );
  }

  Widget _buildCounterScreen() => BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(ShowCounterValue(0)), child: HomePage());
}