import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guided_camera/ui/camera.dart';

class Home extends StatefulWidget {
  static const ROUTE = '/';
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 450,
              width: 300,
              margin: EdgeInsets.only(top: 10),
              color: Colors.grey[200],
              child: (_imageFile != null) ? Image.file(_imageFile) : SizedBox(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _imageFile = await Navigator.push<File>(
              context, MaterialPageRoute(builder: (_) => Camera()));
          setState(() {});
        },
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
