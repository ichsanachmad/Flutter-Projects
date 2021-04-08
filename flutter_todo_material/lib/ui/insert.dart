import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_material/bloc/todo/todo_bloc.dart';
import 'package:flutter_todo_material/bloc/todo/todo_event.dart';
import 'package:flutter_todo_material/bloc/todo/todo_state.dart';
import 'package:flutter_todo_material/data/repository/local/local_repository.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Insert extends StatelessWidget {
  static const ROUTE = '/insert';
  final bool isUpdate;

  Insert({this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(),
      child: InsertContainer(),
    );
  }
}

class InsertContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: BlocConsumer<ToDoBloc, ToDoState>(
        builder: (context, state) {
          return InsertToDoFieldContainer();
        },
        listener: (context, state) {
          if (state is ToDoActionSuccessState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

class InsertToDoFieldContainer extends StatefulWidget {
  @override
  _InsertToDoFieldContainerState createState() =>
      _InsertToDoFieldContainerState();
}

class _InsertToDoFieldContainerState extends State<InsertToDoFieldContainer> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  String _statusToDoDropDownValue = "To Do";
  DateTime _choosenDateTime = DateTime.now();

  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(9999));
    _choosenDateTime = picked;
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Form(
          child: ListView(
            children: [
              Container(
                child: TextFormField(
                  controller: _titleTextController,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _descriptionTextController,
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
              ),
              Container(
                child: DropdownButton(
                  isExpanded: true,
                  value: _statusToDoDropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (value) {
                    setState(() => _statusToDoDropDownValue = value);
                  },
                  items: ['To Do', 'Done']
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Container(
                            child: Text(e),
                          )))
                      .toList(),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _dateTextController,
                  onTap: () async {
                    _dateTextController.text =
                        (await _selectDate(context)).toString();
                  },
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: 'Date', suffixIcon: Icon(Icons.date_range)),
                ),
              ),
              Container(
                child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {
                      bool _toDoIsDone = false;
                      if (_statusToDoDropDownValue == 'Done') {
                        _toDoIsDone = false;
                      }
                      context.read<ToDoBloc>().add(InsertToDoEvent(
                          toDoData: ToDoCompanion(
                              title:
                                  Value(_titleTextController.text.toString()),
                              description: Value(
                                  _descriptionTextController.text.toString()),
                              isDone: Value(_toDoIsDone),
                              createdDate: Value(_choosenDateTime))));
                    }),
              )
            ],
          ),
        ));
  }
}
