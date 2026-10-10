import 'package:bio_tox/core/entities/sintoma.dart';
import 'package:bio_tox/core/enum/risk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Specie {
  final String id;
  final List<ImageProvider> images;
  List<List<double>> embeddings;
  final List<String> embedingAssets;
  final String commonName;
  final String scientificName;
  final Risk risk;
  final String tipoDeVeneno;
  final List<Sintoma> sintomas;
  final List<String> tratamientos;
  final String genero;
  final String familia;
  double? similarity;

  Specie({
    String? id,
    List<List<double>>? embeddings,
    required this.images,
    required this.commonName,
    required this.scientificName,
    required this.risk,
    required this.tipoDeVeneno,
    required this.sintomas,
    required this.tratamientos,
    required this.genero,
    required this.familia,
    this.similarity,
    required this.embedingAssets,
  }) : this.id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       this.embeddings = embeddings ?? [];

  Specie copyWith({
    String? id,
    List<CachedNetworkImageProvider>? images,
    List<List<double>>? embeddings,
    String? commonName,
    String? scientificName,
    Risk? risk,
    String? tipoDeVeneno,
    List<Sintoma>? sintomas,
    List<String>? tratamientos,
    String? genero,
    String? familia,
    double? similarity,
    List<String>? embedingsAssets,
  }) {
    return Specie(
      id: id ?? this.id,
      images: images ?? this.images,
      embeddings: embeddings ?? this.embeddings,
      commonName: commonName ?? this.commonName,
      scientificName: scientificName ?? this.scientificName,
      risk: risk ?? this.risk,
      tipoDeVeneno: tipoDeVeneno ?? this.tipoDeVeneno,
      sintomas: sintomas ?? this.sintomas,
      tratamientos: tratamientos ?? this.tratamientos,
      genero: genero ?? this.genero,
      familia: familia ?? this.familia,
      similarity: similarity ?? this.similarity,
      embedingAssets: embedingsAssets ?? this.embedingAssets,
    );
  }
}
