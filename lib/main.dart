import 'package:bio_tox/UI/main_screen.dart';
import 'package:bio_tox/UI/scanner/scanner_result_screen.dart';
import 'package:bio_tox/UI/scanner/scanner_screen.dart';

import 'package:bio_tox/app/theme/app_theme.dart';
import 'package:bio_tox/core/features/scanner_handler/scanner_handler.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScannerHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'BioTox',
        home: ResultScreen(),
      ),
    );
  }
}
