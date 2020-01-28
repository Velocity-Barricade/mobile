import 'dart:io';

import 'package:barricade/Utils/planes_to_file.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class QRTest extends StatefulWidget {
  var cameras;
  QRTest({this.cameras});
  @override
  _QRTestState createState() => _QRTestState();
}

class _QRTestState extends State<QRTest> {
  CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
      print(controller);
    return Center(
      child: new RaisedButton(onPressed: (){
        controller.startImageStream((CameraImage img) async {
         // var testimg=img.toString();
          var png=await convertYUV420toImageColor(img);
          File file= File.fromRawPath(png);
          //          File file = File
          print("jjjj");
          CameraPreview(controller);
        });}),
    );
  }
}
