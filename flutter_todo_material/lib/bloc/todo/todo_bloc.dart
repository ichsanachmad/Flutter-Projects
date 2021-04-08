import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_material/bloc/todo/todo_event.dart';
import 'package:flutter_todo_material/bloc/todo/todo_state.dart';
import 'package:flutter_todo_material/data/repository/local/local_repository.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final LocalRepository _localRepository = LocalRepository();
  StreamSubscription _toDoListSubscription;

  ToDoBloc() : super(InitialState());

  @override
  Stream<ToDoState> mapEventToState(ToDoEvent event) async* {
    if (event is GetToDoEvent) {
      getToDo();
    } else if (event is UpdateToDoListEvent) {
      yield GetToDoSuccessState(toDos: event.toDos);
    } else if (event is InsertToDoEvent) {
      yield insertToDo(event.toDoData);
    } else if (event is UpdateToDoEvent) {
      yield updateToDo(event.toDoData);
    } else {
      throw Exception('IllegalStateException');
    }
  }

  ToDoState insertToDo(ToDoCompanion toDoData) {
    try {
      _localRepository.insertToDo(toDoData);
      return ToDoActionSuccessState(message: 'Success');
    } catch (e) {
      return ToDoActionErrorState(message: 'Error');
    }
  }

  ToDoState updateToDo(ToDoCompanion toDoData) {
    try {
      _localRepository.updateToDo(toDoData);
      return ToDoActionSuccessState(message: 'Success');
    } catch (e) {
      return ToDoActionErrorState(message: 'Error');
    }
  }

  void getToDo() {
    _toDoListSubscription?.cancel();
    _toDoListSubscription = _localRepository.watchAllToDo().listen((event) {
      print('bloc: ' + event.toString());
      add(UpdateToDoListEvent(toDos: event));
    });
  }
}
