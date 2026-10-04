class ScannResult {
  final double similarity;
  final String animalName;

  ScannResult({required this.similarity, required this.animalName});

  factory ScannResult.fromJson(Map<String, dynamic> json) {
    return ScannResult(
      animalName: json['animalName'],
      similarity: json['similarity'],
    );
  }
}
