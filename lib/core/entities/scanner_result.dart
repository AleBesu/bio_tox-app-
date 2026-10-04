import 'package:bio_tox/core/entities/specie.dart';

class ScannerResult {
  final Specie specieID;
  final double similarity;

  ScannerResult({required this.specieID, required this.similarity});
}
