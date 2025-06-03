part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int increment;

  const CounterIncreased(this.increment);

  // @override
  // List<Object> get props => [increment];
}




class CounterReset extends CounterEvent {
  const CounterReset();

  // @override
  // List<Object> get props => [increment];
}