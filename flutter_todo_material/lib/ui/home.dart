import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_material/bloc/todo/todo_bloc.dart';
import 'package:flutter_todo_material/bloc/todo/todo_event.dart';
import 'package:flutter_todo_material/bloc/todo/todo_state.dart';
import 'package:flutter_todo_material/data/repository/local/local_repository.dart';
import 'package:flutter_todo_material/ui/insert.dart';

class Home extends StatelessWidget {
  static const ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(),
      child: HomeContainer(),
    );
  }
}

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  void initState() {
    context.read<ToDoBloc>().add(GetToDoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo with Moor'),
      ),
      body: SafeArea(
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state is InitialState) {
              return Center(
                child: Text('Init State'),
              );
            } else if (state is GetToDoSuccessState) {
              log(state.toDos.toString());
              return ToDoListContainer(toDoData: state.toDos);
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Insert.ROUTE);
        },
      ),
    );
  }
}

class ToDoListContainer extends StatelessWidget {
  final List<ToDoData> toDoData;

  ToDoListContainer({this.toDoData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: toDoData.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 5,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(15),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          toDoData[index].title,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(toDoData[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontSize: 12)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)]),
          );
        });
  }
}
