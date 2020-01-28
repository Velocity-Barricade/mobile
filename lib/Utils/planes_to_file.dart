//import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart';
Future<List<int>> convertYUV420toImageColor(CameraImage image) async {
  final width = image.width;
  final height = image.height;
  final uvRowStride = image.planes[1].bytesPerRow;
  // MEMO: null(iPhone XS Plus)
  final uvPixelStride = image.planes[1].bytesPerPixel ?? 1;

//  logger.fine('uvRowStride: $uvRowStride');
//  logger.fine('uvPixelStride: $uvPixelStride');


  // imgLib -> Image package from https://pub.dartlang.org/packages/image
  final img = Image(width, height); // Create Image buffer

  // Fill image buffer with plane[0] from YUV420_888
  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      final uvIndex =
          uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
      final index = y * width + x;

      final yp = image.planes[0].bytes[index];
      final up = image.planes[1].bytes[uvIndex];
      // MEMO: image.planes' length is 2(iPhone XS Plus)
      final vp = image.planes.length > 2 ? image.planes[2].bytes[uvIndex] : 0;
      // Calculate pixel color
      final r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255).toInt();
      final g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
          .round()
          .clamp(0, 255)
          .toInt();
      final b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255).toInt();
      // color: 0x FF  FF  FF  FF
      //           A   B   G   R
      img.data[index] = (0xFF << 24) | (b << 16) | (g << 8) | r;
    }
  }


  final png = PngEncoder(level: 0, filter: 0).encodeImage(img);
  // MEMO: What?
//      muteYUVProcessing = false;
  return png;
}