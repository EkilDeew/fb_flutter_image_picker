import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fb_img_picker/fb_img_picker.dart';

void main() {
  const MethodChannel channel = MethodChannel('fb_img_picker');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'test.com';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('pickImage', () async {
    expect(await FbImgPicker.pickImage(), ['test.com']);
  });
}
