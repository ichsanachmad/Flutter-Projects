import 'package:flutter/material.dart';
import 'package:flutter_reactive/bloc/movie/movie_bloc.dart';
import 'package:flutter_reactive/data/response/movie_list_response/movie_list_response.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    moviesBloc..getMovies();
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: moviesBloc.subject.stream,
              builder: (context, AsyncSnapshot<MovieListResponse> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.movies.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data.movies[index].title);
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ));
  }
}
