import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  runApp(MyApp());
}

const simpleTaskKey = "simpleTask";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void callbackCounterDispatcher() {
  Workmanager.executeTask((taskName, inputData) {
    switch (taskName) {
      case simpleTaskKey:
        print(inputData['data']);
        break;
    }
    return Future.value(true);
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    Workmanager.initialize(
      callbackCounterDispatcher,
      isInDebugMode: false,
    );
    super.initState();
  }

  void _incrementCounter() {
    Workmanager.registerOneOffTask("1", simpleTaskKey,
        inputData: {'data': ++_counter});
    setState(() => _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
