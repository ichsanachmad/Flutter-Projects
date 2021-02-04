import 'package:equatable/equatable.dart';
import 'package:flutter_guru/data/model/teacher/teacher.dart';

class TeacherState extends Equatable {
  @override
  List<Object> get props => [];
}

class TeacherUpdateListState extends TeacherState {
  final List<Teacher> teachers;

  TeacherUpdateListState({this.teachers});

  @override
  List<Object> get props => [this.teachers];
}

class TeacherSuccessState extends TeacherState {
  final String message;

  TeacherSuccessState({this.message});

  @override
  List<Object> get props => [this.message];
}

class TeacherErrorState extends TeacherState {
  final String message;

  TeacherErrorState({this.message});

  @override
  List<Object> get props => [this.message];
}
