import 'package:equatable/equatable.dart';
import 'package:flutter_todo_material/data/repository/local/local_repository.dart';

class ToDoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetToDoEvent extends ToDoEvent {
  @override
  List<Object> get props => [];
}

class UpdateToDoListEvent extends ToDoEvent {
  final List<ToDoData> toDos;

  UpdateToDoListEvent({this.toDos});

  @override
  List<Object> get props => [toDos];
}

class InsertToDoEvent extends ToDoEvent {
  final ToDoCompanion toDoData;

  InsertToDoEvent({this.toDoData});

  @override
  List<Object> get props => [toDoData];
}

class UpdateToDoEvent extends ToDoEvent {
  final ToDoCompanion toDoData;

  UpdateToDoEvent({this.toDoData});

  @override
  List<Object> get props => [toDoData];
}
