import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_guru/data/model/teacher/teacher.dart';

class ListItemTeacher extends StatelessWidget {
  final Teacher teacher;

  ListItemTeacher({this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        child: Material(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(5),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(teacher.name),
              )
            ],
          ),
        ));
  }
}
