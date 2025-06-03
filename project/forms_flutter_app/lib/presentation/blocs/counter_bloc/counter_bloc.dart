import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 5)) {
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    final newCounter = state.counter + event.increment;
    final newTransactionCounter = state.transactionCounter + 1;

    emit(
      state.copyWith(
        counter: newCounter,
        transactionCounter: newTransactionCounter,
      ),
    );
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    final newCounter = 0;

    emit(
      state.copyWith(
        counter: newCounter,
      ),
    );
  }



  void increaseBy(int increment) {
    add(CounterIncreased(increment));
  }
  void resetCounter() {
    add(CounterReset());
  }
}
