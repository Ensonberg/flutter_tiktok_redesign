import 'dart:io';

import 'package:get/get.dart';

class AddVideoController extends GetxController {
  late File _file;
  late String _caption;
  late File _trimmedVideo;

  File get file => _file;

  void addFile(File value) {
    _file = value;
    update();
  }

  File get trimmedVideo => _trimmedVideo;

  void addTrimmedVideo(File value) {
    _trimmedVideo = value;
    update();
  }

  String get caption => _caption;

  set caption(String value) {
    _caption = value;
    update();
  }
}
