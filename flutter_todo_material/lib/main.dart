import 'package:flutter/material.dart';
import 'package:flutter_todo_material/navigation/app_navigator.dart';
import 'package:flutter_todo_material/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appNavigator = AppNavigator();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Home.ROUTE,
      onGenerateRoute: _appNavigator.onGenerateRoute,
    );
  }
}
