// Evenements
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

abstract class CounterState {}

// Etats / States
class ResultCounterState extends CounterState {
  final int counter;

  ResultCounterState(this.counter);
}

// Bloc
class DecrementCounterBloc extends Bloc<CounterEvent, CounterState> {
  static final int initialValue = 50;
  int counter = initialValue;

  DecrementCounterBloc() : super(ResultCounterState(initialValue));

  void decrementCounter() {
    add(DecrementCounterEvent());
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is DecrementCounterEvent) {
      yield ResultCounterState(--counter);
    }
  }
}

// Vue
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DecrementCounterBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('Coucou'),
            BlocBuilder<DecrementCounterBloc, CounterState>(
              buildWhen: (_, CounterState newState) {
                if (newState is ResultCounterState) {
                  return newState.counter % 2 == 0;
                } else {
                  return false;
                }
              },
              builder: (BuildContext context, CounterState state) {
                if (state is ResultCounterState) {
                  return Text(state.counter.toString());
                } else {
                  return const SizedBox();
                }
              },
            ),
            Text('Coucou'),
            Builder(builder: (BuildContext context) {
              return TextButton(
                  onPressed: () {
                    BlocProvider.of<DecrementCounterBloc>(context)
                        .decrementCounter();
                  },
                  child: Text('Décrémenter'));
            }),
          ],
        ),
      ),
    );
  }
}
