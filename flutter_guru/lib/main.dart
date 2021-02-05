import 'package:flutter/material.dart';
import 'package:flutter_guru/ui/detail.dart';
import 'package:flutter_guru/ui/home.dart';
import 'package:flutter_guru/ui/insert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.ROUTE,
      onGenerateRoute: _onGenerateRoute,
      routes: {},
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder _builder;
    switch (settings.name) {
      case Home.ROUTE:
        _builder = (context) => Home();
        break;

      case Insert.ROUTE:
        _builder = (context) => Insert();
        break;

      case Detail.ROUTE:
        _builder = (context) => Detail(settings.arguments);
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: _builder, settings: settings);
  }
}
