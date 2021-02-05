import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/bloc/teacher/teacher_bloc.dart';
import 'package:flutter_guru/bloc/teacher/teacher_event.dart';
import 'package:flutter_guru/bloc/teacher/teacher_state.dart';
import 'package:flutter_guru/ui/detail.dart';
import 'package:flutter_guru/ui/insert.dart';
import 'package:flutter_guru/widgets/list_item_teacher.dart';

class Home extends StatelessWidget {
  static const ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherBloc(),
      child: HomeContainer(),
    );
  }
}

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: HomeTeacherList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Insert.ROUTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeTeacherList extends StatefulWidget {
  @override
  _HomeTeacherListState createState() => _HomeTeacherListState();
}

class _HomeTeacherListState extends State<HomeTeacherList> {
  @override
  void initState() {
    context.read<TeacherBloc>().add(LoadTeacherListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherBloc, TeacherState>(builder: (_, state) {
      if (state is TeacherUpdateListState) {
        return ListView.builder(
            itemCount: state.teachers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Detail.ROUTE,
                      arguments: state.teachers[index]);
                },
                child: ListItemTeacher(teacher: state.teachers[index]),
              );
            });
      }

      return Container();
    });
  }
}
