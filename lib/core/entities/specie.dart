import 'package:bio_tox/core/entities/sintoma.dart';
import 'package:bio_tox/core/enum/risk.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Specie {
  final String id;
  final List<CachedNetworkImageProvider> images;
  final List<List<double>> embeddings;
  final String commonName;
  final String scientificName;
  final Risk risk;
  final String tipoDeVeneno;
  final List<Sintoma> sintomas;
  final List<String> tratamientos;
  final String genero;
  final String familia;

  Specie({
    String? id,
    required this.embeddings,
    required this.images,
    required this.commonName,
    required this.scientificName,
    required this.risk,
    required this.tipoDeVeneno,
    required this.sintomas,
    required this.tratamientos,
    required this.genero,
    required this.familia,
  }) : this.id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}
