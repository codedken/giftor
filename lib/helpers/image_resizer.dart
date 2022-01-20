import 'dart:io';
import 'dart:isolate';
import 'package:image/image.dart';

class DecodeParam {
  final File file;
  final SendPort sendPort;
  DecodeParam(this.file, this.sendPort);
}

class ImageResizer {
  static void decodeIsolate(DecodeParam param) {
    // Read an image from file (webp in this case).
    // decodeImage will identify the format of the image and use the appropriate
    // decoder.
    var image = decodeImage(param.file.readAsBytesSync())!;
    // Resize the image to a 500x? (maintaining the aspect ratio).
    var resizedImage = copyResize(image, width: 500);
    param.sendPort.send(resizedImage);
  }
}
