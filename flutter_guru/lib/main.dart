import 'package:flutter/material.dart';
import 'package:flutter_guru/ui/home.dart';
import 'package:flutter_guru/ui/insert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.ROUTE,
      routes: {
        Home.ROUTE: (context) => Home(),
        Insert.ROUTE: (context) => Insert()
      },
    );
  }
}
