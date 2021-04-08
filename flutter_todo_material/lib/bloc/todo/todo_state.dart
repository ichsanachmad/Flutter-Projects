import 'package:equatable/equatable.dart';
import 'package:flutter_todo_material/data/repository/local/local_repository.dart';

class ToDoState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends ToDoState {
  @override
  List<Object> get props => [];
}

class GetToDoSuccessState extends ToDoState {
  final List<ToDoData> toDos;

  GetToDoSuccessState({this.toDos});

  @override
  List<Object> get props => [toDos];
}

class ToDoActionSuccessState extends ToDoState {
  final String message;

  ToDoActionSuccessState({this.message});

  @override
  List<Object> get props => [message];
}

class ToDoActionErrorState extends ToDoState {
  final String message;

  ToDoActionErrorState({this.message});

  @override
  List<Object> get props => [message];
}
