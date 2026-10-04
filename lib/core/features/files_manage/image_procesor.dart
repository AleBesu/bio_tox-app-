import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_background_remover/image_background_remover.dart';

class ImageProcesor {
  static Future<FileImage> removeBackground(FileImage image) async {
    //!this need call   BackgroundRemover.instance.initializeOrt(); befores use
    //!and call dispose after use BackgroundRemover.instance.dispose();
    //!call this method in init state and dispose in dispose of the screen where you use

    try {
      final procesedImageBytes = await BackgroundRemover.instance.removeBgBytes(
        image.file.readAsBytesSync(),
      );
      File procesedImgFile = File(image.file.path);
      procesedImgFile.writeAsBytesSync(procesedImageBytes);
      return FileImage(procesedImgFile);
    } catch (e) {
      rethrow;
    }
  }
}
