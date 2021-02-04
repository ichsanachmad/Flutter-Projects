import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/bloc/teacher/teacher_event.dart';
import 'package:flutter_guru/bloc/teacher/teacher_state.dart';
import 'package:flutter_guru/data/network/network_repository.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  NetworkRepository _repo = NetworkRepository();

  TeacherBloc() : super(TeacherState());

  @override
  Stream<TeacherState> mapEventToState(TeacherEvent event) async* {
    if (event is LoadTeacherListEvent) {
      yield await _onLoadTeacherList();
    } else if (event is InsertTeacherEvent) {
      yield await _onInsertTeacher(
          event.nip, event.name, event.email, event.password);
    }
  }

  Future<TeacherState> _onLoadTeacherList() async {
    try {
      var data = await _repo.getTeachers();
      return TeacherUpdateListState(teachers: data.data);
    } catch (e) {
      return TeacherErrorState(message: e.toString());
    }
  }

  Future<TeacherState> _onInsertTeacher(
      String nip, String name, String email, String password) async {
    try {
      var data = await _repo.insertTeacher(nip, name, email, password);
      return TeacherSuccessState(message: data.message);
    } catch (e) {
      return TeacherErrorState(message: e.toString());
    }
  }
}
