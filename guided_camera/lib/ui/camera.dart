import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController _cameraController;

  Future<void> initializeCamera() async {
    var camera = await availableCameras();
    _cameraController = CameraController(camera[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<File> takePicture() async {
    XFile file = await _cameraController.takePicture();
    try {
      return File(file.path);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: initializeCamera(),
          builder: (_, snapshot) => (snapshot.connectionState ==
                  ConnectionState.done)
              ? Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width *
                              _cameraController.value.aspectRatio,
                          child: CameraPreview(_cameraController),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 70,
                          width: 70,
                          child: RaisedButton(
                            onPressed: () async {
                              if (!_cameraController.value.isTakingPicture) {
                                File imageResult = await takePicture();
                                Navigator.pop(context, imageResult);
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Camera is Taking Picture, Please Wait')));
                              }
                            },
                            shape: CircleBorder(),
                            color: Colors.amber,
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                )),
    );
  }
}
