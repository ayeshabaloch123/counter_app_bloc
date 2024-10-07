import 'package:bloc_code/bloc/counter/counter_event.dart';
import 'package:bloc_code/bloc/counter/counter_state.dart';
import 'package:bloc_code/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScree extends StatefulWidget {
  const CounterScree({Key? key}) : super(key: key);

  @override
  _CounterScreeState createState() => _CounterScreeState();
}

class _CounterScreeState extends State<CounterScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Center(
                child: Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 60),
            ));
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: Text('increment'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: Text('decrement'),
              )
            ],
          )
        ],
      ),
    );
  }
}
