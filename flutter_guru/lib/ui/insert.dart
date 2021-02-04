import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/bloc/teacher/teacher_bloc.dart';
import 'package:flutter_guru/bloc/teacher/teacher_event.dart';
import 'package:flutter_guru/bloc/teacher/teacher_state.dart';

class Insert extends StatelessWidget {
  static const ROUTE = '/teacher/addedit';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherBloc(),
      child: InsertContainer(),
    );
  }
}

class InsertContainer extends StatefulWidget {
  @override
  _InsertContainerState createState() => _InsertContainerState();
}

class _InsertContainerState extends State<InsertContainer> {
  bool _isPasswordVisible = false;
  TextEditingController _nipTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _nipTextController.dispose();
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeacherBloc, TeacherState>(
      listener: (context, state) {
        if (state is TeacherSuccessState) {
          print(state.message);
          Navigator.pop(context);
        }
      },
      builder: (_, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Tambah Guru'),
            ),
            body: Form(
              child: ListView(
                children: [
                  Container(
                    child: TextFormField(
                        controller: _nipTextController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(labelText: 'Nip Guru')),
                  ),
                  Container(
                    child: TextFormField(
                        controller: _nameTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'Nama Guru')),
                  ),
                  Container(
                    child: TextFormField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email Guru')),
                  ),
                  Container(
                    child: TextFormField(
                      controller: _passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: !this._isPasswordVisible,
                      decoration: InputDecoration(
                          labelText: 'Password Guru',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: this._isPasswordVisible
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() => this._isPasswordVisible =
                                  !this._isPasswordVisible);
                            },
                          )),
                    ),
                  ),
                  Container(
                      child: RaisedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            context.read<TeacherBloc>().add(InsertTeacherEvent(
                                nip: _nipTextController.text.toString(),
                                name: _nameTextController.text.toString(),
                                email: _emailTextController.text.toString(),
                                password:
                                    _passwordTextController.text.toString()));
                          })),
                ],
              ),
            ));
      },
    );
  }
}
