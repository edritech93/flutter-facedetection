import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:facedetection/facedetection.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void _onPressAdd() async {
    final _xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_xFile != null) {
      print("_xFile => ${_xFile.path}");
      setState(() {
        imagePath = _xFile.path;
      });
      final faces = await Facedetection.getFaces(imagePath: _xFile.path);
      print("_onPressAdd faces => ${faces.length}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: imagePath != null ? Image.file(File(imagePath!)) : null,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _onPressAdd(),
        ),
      ),
    );
  }
}
