import 'package:flutter/material.dart';

class ScannerResultScreen extends StatelessWidget {
  List<Map<String, double>> resultsDetailed;

  FileImage pickedImage;
  ScannerResultScreen({
    required this.resultsDetailed,
    required this.pickedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner Result')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: pickedImage),
                ),
              ),
              SizedBox(height: 12),

              Text(
                "Detallado",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              ...resultsDetailed.map(
                (e) => Text(
                  e.keys.first + ":" + e.values.first.toStringAsFixed(2),
                ),
              ),
              // ...results.entries.map(
              //   (e) => Text("${e.key}: ${e.value.toStringAsFixed(2)}%"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
