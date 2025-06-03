import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_flutter_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void incrementCounter(BuildContext context, int increment) {
    // context.read<CounterBloc>().add(CounterIncreased(increment));
    context.read<CounterBloc>().increaseBy(increment);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc state) => 
          Text('Bloc Counter: ${state.state.transactionCounter}')),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {
            // context.read<CounterBloc>().add(const CounterReset());
            context.read<CounterBloc>().resetCounter();
          }),
        ],
      ),
      body: Center(
        child: 
        context.select((CounterBloc state) => Text('Counter value: ${state.state.counter}')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              // Increment counter logic
              incrementCounter(context, 1);
            },
            child: const Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              // Decrement counter logic
              incrementCounter(context, 2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              // Decrement counter logic
              incrementCounter(context, 3);
            },
            child: const Text('+3'),
          ),
        ],
      ),
    );
  }
}
