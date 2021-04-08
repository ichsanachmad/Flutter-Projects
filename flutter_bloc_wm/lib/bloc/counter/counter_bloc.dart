import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';

enum CounterEvent { IncrementEvent }

class CounterBloc extends Bloc<CounterEvent, int> {
  static const _SIMPLE_TASK = "simpleTask";
  int _counter = 0;

  CounterBloc() : super(0);

  void callbackDispatcher() {
    Workmanager.executeTask((taskName, inputData) {
      switch (taskName) {
        case _SIMPLE_TASK:
          _counter++;
          break;
      }

      return Future.value(true);
    });
  }

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event == CounterEvent.IncrementEvent) {
      // Workmanager.registerOneOffTask("1", _SIMPLE_TASK);
      
      yield state+1;
    }
  }
}
