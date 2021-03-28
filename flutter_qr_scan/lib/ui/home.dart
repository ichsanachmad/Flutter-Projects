import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrViewController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController.resumeCamera();
    }
  }

  void _onQrViewCreated(QRViewController controller) {
    _qrViewController = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        print(event.code.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQrViewCreated,
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _qrViewController.dispose();
    super.dispose();
  }
}
