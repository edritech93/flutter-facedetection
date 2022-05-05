import 'dart:async';

import 'package:flutter/services.dart';

class Facedetection {
  static const MethodChannel _channel = MethodChannel('facedetection');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<List<dynamic>> getFaces({required String imagePath}) async {
    final List<dynamic> faceList = await _channel
        .invokeMethod('getFaces', <String, dynamic>{'path': imagePath});
    return faceList;
  }
}
