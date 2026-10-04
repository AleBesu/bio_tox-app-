import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<FileImage?> croppeImage(
  FileImage image, {
  double? radioX,
  double? radioY,
}) async {
  final croppedImage = await ImageCropper().cropImage(
    sourcePath: image.file.path,
    uiSettings: [],
    aspectRatio: CropAspectRatio(ratioX: radioX ?? 1, ratioY: radioY ?? 1),
  );

  return croppedImage != null ? FileImage(File(croppedImage.path)) : null;
}
