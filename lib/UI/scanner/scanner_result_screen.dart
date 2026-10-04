import 'package:bio_tox/core/entities/scann_result.dart';
import 'package:flutter/material.dart';

class ScannerResultScreen extends StatefulWidget {
  List<ScannResult> results;

  FileImage pickedImage;
  ScannerResultScreen({required this.results, required this.pickedImage});

  @override
  State<ScannerResultScreen> createState() => _ScannerResultScreenState();
}

class _ScannerResultScreenState extends State<ScannerResultScreen> {
  List<ScannResult> results = [];

  @override
  void initState() {
    sortResults();

    super.initState();
  }

  void sortResults() {
    results = widget.results.toList();

    //sort
    results.sort((a, b) {
      return b.similarity.compareTo(a.similarity);
    });

    //take only 4 results
    results = results.take(3).toList();

    setState(() {});
  }

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
                  image: DecorationImage(image: widget.pickedImage),
                ),
              ),
              SizedBox(height: 12),

              Text(
                "Detallado",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              ...results.map(
                (e) =>
                    Text(e.animalName + ":" + e.similarity.toStringAsFixed(2)),
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
