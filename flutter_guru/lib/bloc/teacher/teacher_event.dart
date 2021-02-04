import 'package:equatable/equatable.dart';

class TeacherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTeacherListEvent extends TeacherEvent {}

class InsertTeacherEvent extends TeacherEvent {
  final String nip;
  final String name;
  final String email;
  final String password;

  InsertTeacherEvent({this.nip, this.name, this.email, this.password});

  @override
  List<Object> get props => [this.nip, this.name, this.email, this.password];
}
