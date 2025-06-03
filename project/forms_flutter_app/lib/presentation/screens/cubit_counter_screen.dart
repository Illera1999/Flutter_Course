import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_flutter_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _WidgetCounterView(),
    );
  }
}

class _WidgetCounterView extends StatelessWidget {
  const _WidgetCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCounter}');
        },),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Reset counter logic
              context.read<CounterCubit>().reset();
            },
          ),
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => previous.counter != current.counter,
        builder: (context, state) {
          // With Equatable, no need to check for changes
          return Center(child: Text('Counter value: ${state.counter}'));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              // Increment counter logic
              context.read<CounterCubit>().increaseBy(1);
            },
            child: const Text('+1'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              // Decrement counter logic
              context.read<CounterCubit>().increaseBy(2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () {
              // Decrement counter logic
              context.read<CounterCubit>().increaseBy(3);
            },
          ),
        ],
      ),
    );
  }
}
