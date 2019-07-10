import 'dart:async';

import 'package:flutter/services.dart';

class FbImgPicker {

  static const MethodChannel _channel =
      const MethodChannel('fb_img_picker');

  static Future<String> pickImage() async {
    try {
      var result = await _channel.invokeMethod('pickImage');
      return (result);
    } catch (e) {
      print(e);
      return (null);
    }
  }

}
