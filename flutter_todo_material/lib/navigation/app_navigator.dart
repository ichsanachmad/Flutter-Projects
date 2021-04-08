import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_material/ui/home.dart';
import 'package:flutter_todo_material/ui/insert.dart';

class AppNavigator {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder _builder;
    switch (settings.name) {
      case Home.ROUTE:
        _builder = (context) => Home();
        break;

      case Insert.ROUTE:
        _builder = (context) => Insert();
        break;

      default:
        throw Exception('Illegal State ${settings.name}');
    }

    return MaterialPageRoute(builder: _builder, settings: settings);
  }
}
