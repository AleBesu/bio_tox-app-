import 'dart:convert';

import 'package:bio_tox/UI/main_screen.dart';

import 'package:bio_tox/app/theme/app_theme.dart';
import 'package:bio_tox/core/const/species_catalog.dart';
import 'package:bio_tox/core/features/scanner_handler/scanner_handler.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScannerHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    loadSpecieEmbedings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'BioTox',
        home: MainScreen(),
      ),
    );
  }
}

Future<void> loadSpecieEmbedings() async {
  for (var currentSpecie in specieCatalogList) {
    for (var currentEmbedingAsset in currentSpecie.embedingAssets) {
      final data = jsonDecode(
        jsonDecode(await rootBundle.loadString(currentEmbedingAsset)),
      );

      currentSpecie.embeddings.add(List<double>.from(data));
    }
  }
}
