import 'package:flutter/material.dart';
import 'package:flutter_guru/data/model/teacher/teacher.dart';

class Detail extends StatelessWidget {
  static const ROUTE = '/detail';

  final Teacher teacher;
  Detail(this.teacher);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teacher.name),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
