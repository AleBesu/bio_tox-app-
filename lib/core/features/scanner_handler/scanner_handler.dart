import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';
import 'package:image/image.dart' as img;

abstract class ScannerHandler {
  static late OrtSession session;

  static List<Map<String, List<double>>> animalsEmbedingsList = [];
  static Map<String, List<String>> animalsEmbedings = {
    'bothrops atrox': [
      'assets/animals/bothrops_atrox/1.json',
      'assets/animals/bothrops_atrox/2.json',
    ],
    // 'bothrops_barnetti': [
    //   'assets/animals/bothrops_barnetti/1.json',
    //   'assets/animals/bothrops_barnetti/2.json',
    //   'assets/animals/bothrops_barnetti/3.json',
    //   'assets/animals/bothrops_barnetti/5.json',
    //   'assets/animals/bothrops_barnetti/6.json',
    //   'assets/animals/bothrops_barnetti/7.json',
    // ],
    'bothrops_pictus': [
      'assets/animals/bothrops_pictus/1.json',
      'assets/animals/bothrops_pictus/2.json',
    ],
    'lachesis': [
      'assets/animals/lachesis/1.json',
      'assets/animals/lachesis/2.json',
      'assets/animals/lachesis/3.json',
    ],
    'pseudalsophis_elegans': [
      'assets/animals/pseudalsophis_elegans/1.json',
      'assets/animals/pseudalsophis_elegans/2.json',
    ],

    'bothrops_bilineatus': [
      'assets/animals/bothrops_bilineatus/1.json',
      'assets/animals/bothrops_bilineatus/2.json',
    ],
    'micrurus': [
      'assets/animals/micrurus/1.json',
      'assets/animals/micrurus/2.json',
      'assets/animals/micrurus/3.json',
    ],
    'pseudoboa_ncoronata': [
      'assets/animals/pseudoboa_ncoronata/1.json',
      'assets/animals/pseudoboa_ncoronata/2.json',
      'assets/animals/pseudoboa_ncoronata/3.json',
    ],

    "bothrops_taeniatus": [
      "assets/animals/bothrops_taeniatus/1.json",
      "assets/animals/bothrops_taeniatus/2.json",
    ],
  };

  static Future<void> init() async {
    final ort = OnnxRuntime();
    session = await ort.createSessionFromAsset(
      'assets/models/mobile_cli2_s2/vision_model.onnx',
    );

    //add animals list
    for (final animal in animalsEmbedings.entries) {
      for (final asset in animal.value) {
        final embedding = List<double>.from(
          jsonDecode(jsonDecode(await rootBundle.loadString(asset))),
        );

        animalsEmbedingsList.add({animal.key: embedding});
      }
    }
  }

  //=================Get Embeding=========================

  static Future<List<double>> getEmbedingFromImage(img.Image image) async {
    if (image.width != image.height) {
      throw ("The imagen should be square");
    }
    image = img.copyResize(image, width: 256, height: 256);

    final tensor = Float32List(3 * 256 * 256);

    int offset = 0;

    for (int c = 0; c < 3; c++) {
      for (int y = 0; y < 256; y++) {
        for (int x = 0; x < 256; x++) {
          final pixel = image.getPixel(x, y);

          final value = switch (c) {
            0 => pixel.r / 255.0,
            1 => pixel.g / 255.0,
            2 => pixel.b / 255.0,
            _ => 0.0,
          };

          tensor[offset++] = value;

          // print(tensor[c + (c * y) + (x)]);
        }
      }
    }

    final output = await session.run({
      "pixel_values": await OrtValue.fromList(tensor, [1, 3, 256, 256]),
    });

    return (await output.values.first.asFlattenedList())
        .map((e) => e as double)
        .toList();
  }

  Future<List<double>> pickAnimalEmbedings() async {
    final json = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (json == null || json.extension != 'json') {
      throw ("The file should be json");
    }
    return (jsonDecode(File(json.path!).readAsStringSync()) as List)
        .map((e) => e as double)
        .toList();
  }

  static List<Map<String, double>> searchAnimalDetails(List<double> embedings) {
    List<Map<String, double>> scannerResults = [];

    animalsEmbedingsList.forEach((element) {
      final similarity = cosineSimilarity(embedings, element.values.first);

      scannerResults.add({element.keys.first: similarity});
    });

    return scannerResults;
  }

  static double cosineSimilarity(List<double> a, List<double> b) {
    if (a.length != b.length) {
      throw ArgumentError('Los embeddings deben tener la misma dimensión');
    }

    double dotProduct = 0;
    double normA = 0;
    double normB = 0;

    for (int i = 0; i < a.length; i++) {
      dotProduct += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }

    if (normA == 0 || normB == 0) {
      throw ArgumentError('Un embedding no puede ser un vector cero');
    }

    return dotProduct / (sqrt(normA) * sqrt(normB));
  }
}
