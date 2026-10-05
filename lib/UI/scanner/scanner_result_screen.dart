import 'package:bio_tox/UI/widgets/custom_image_widget.dart';
import 'package:bio_tox/UI/widgets/dialogs/show_specie_details_dialog.dart';
import 'package:bio_tox/UI/widgets/risk_chip.dart';
import 'package:bio_tox/app/theme/app_colors.dart';
import 'package:bio_tox/core/entities/scann_result.dart';
import 'package:bio_tox/core/entities/specie.dart';
import 'package:bio_tox/core/enum/risk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// class ScannerResultScreen extends StatefulWidget {
//   List<ScannResult> results;

//   FileImage pickedImage;
//   ScannerResultScreen({required this.results, required this.pickedImage});

//   @override
//   State<ScannerResultScreen> createState() => _ScannerResultScreenState();
// }

// class _ScannerResultScreenState extends State<ScannerResultScreen> {
//   List<ScannResult> results = [];

//   @override
//   void initState() {
//     sortResults();

//     super.initState();
//   }

//   void sortResults() {
//     results = widget.results.toList();

//     //sort
//     results.sort((a, b) {
//       return b.similarity.compareTo(a.similarity);
//     });

//     //take only 4 results
//     results = results.take(3).toList();

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Scanner Result')),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   image: DecorationImage(image: widget.pickedImage),
//                 ),
//               ),
//               SizedBox(height: 12),

//               Text(
//                 "Detallado",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//               ),

//               ...results.map(
//                 (e) =>
//                     Text(e.SpecieName + ":" + e.similarity.toStringAsFixed(2)),
//               ),
//               // ...results.entries.map(
//               //   (e) => Text("${e.key}: ${e.value.toStringAsFixed(2)}%"),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//!==================New screen==========

// class Specie {
//   const Specie({
//     required this.commonName,
//     required this.scientificName,
//     required this.confidence,
//     required this.risk,
//     required this.photos,
//     required this.symptoms,
//     required this.protocol,
//     this.imageAlignment = Alignment.center,
//   });

//   final String commonName;
//   final String scientificName;
//   final int confidence;
//   final Risk risk;
//   final List<String> photos; // photos[0] se usa como miniatura
//   final List<String> symptoms;
//   final List<String> protocol;
//   final Alignment imageAlignment;
// }

// String _u(String id, int w) =>
//     'https://images.unsplash.com/photo-$id?auto=format&fit=crop&w=$w&q=85';

final species = <Specie>[
  Specie(
    embeddings: [],
    images: [],
    commonName: '',
    scientificName: '',
    risk: Risk.alto,
    tipoDeVeneno: '',
    sintomas: [],
    tratamientos: [],
    genero: '',
    familia: '',
  ),
  Specie(
    embeddings: [],
    images: [],
    commonName: '',
    scientificName: '',
    risk: Risk.alto,
    tipoDeVeneno: '',
    sintomas: [],
    tratamientos: [],
    genero: '',
    familia: '',
  ),
  // Specie(
  //   embeddings: [],
  //   images: [],
  //   commonName: '',
  //   scientificName: '',
  //   risk: Risk.alto,
  //   tipoDeVeneno: '',
  //   sintomas: [],
  //   tratamientos: [],
  //   genero: '',
  //   familia: '',
  // ),
];

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int _selected = 0;

  void _rescan() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Escáner preparado', textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1800),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Resultado del análisis', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          children: [
            _HeroCard(specie: species.first),
            const SizedBox(height: 12),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Posibles especies',
            //             // style: text.titleLarge?.copyWith(
            //             //   fontWeight: FontWeight.w600,
            //             // ),
            //           ),
            //           Text(
            //             '3 coincidencias encontradas',
            //             // style: text.bodySmall?.copyWith(color: Colors.white54),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Text(
            //       'Ordenadas por precisión',
            //       // style: text.labelSmall?.copyWith(color: Colors.white38),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 12),
            // for (final (i, currentSpecie) in species.indexed)
            //   _SpecieCard(
            //     specie: currentSpecie,
            //     selected: _selected == i,
            //     onTap: () {
            //       showSpecieDetailsDialog(context, specie: currentSpecie);
            //     },
            //   ),

            ...species.map(
              (currentSpecie) => _SpecieCard(
                specie: currentSpecie,

                onTap: () {
                  showSpecieDetailsDialog(context, specie: currentSpecie);
                },
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _rescan,
              icon: const Icon(Icons.document_scanner_outlined),
              label: const Text('Escanear otro Specie'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor: AppColors.repAccentGreen,
                foregroundColor: const Color(0xFF07130B),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 16),

            //warning
            Card(
              color: const Color(0x0FFF5C60),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0x26FF5C60)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Importante: ',
                        style: TextStyle(
                          color: Color(0xFFFF888B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'esta guía no sustituye atención médica. Ante dificultad respiratoria, desmayo o síntomas intensos, llama a emergencias inmediatamente.',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.5,
                    color: Color(0xFFBA9A9A),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final Specie specie;
  const _HeroCard({required this.specie});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: SizedBox(
        height: 272,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // CustomImageWidget(image: specie.images[1]),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xBF000000), Colors.transparent],
                ),
              ),
            ),
            const Positioned(
              left: 16,
              top: 16,
              child: Chip(
                avatar: Icon(
                  Icons.circle,
                  size: 8,
                  color: AppColors.repAccentGreen,
                ),
                label: Text(
                  'ANÁLISIS COMPLETO',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(0x73000000),
                side: BorderSide(color: Colors.white24),
                visualDensity: VisualDensity.compact,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mejor coincidencia',
                          style: text.labelMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          specie.commonName,
                          style: text.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: const Color(0xCC102B1B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: Color(0x4D5EEA9A)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          // Text(
                          //   '${Specie.confidence}%',
                          //   style: text.titleLarge?.copyWith(
                          //     color: AppColors.repAccentGreen,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          Text(
                            'CONFIANZA',
                            style: text.labelSmall?.copyWith(
                              color: Colors.white60,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpecieCard extends StatelessWidget {
  final Specie specie;

  final VoidCallback onTap;
  const _SpecieCard({
    required this.specie,
    // required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: const Color(0xFF161A18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white12),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: specie.images.isNotEmpty
              ? SizedBox(
                  width: 76,
                  height: 76,
                  child: CustomImageWidget(image: specie.images.first),
                )
              : null,
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                specie.commonName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            // Text(
            //   '${specie.confidence}%',
            //   style: const TextStyle(
            //     color: AppColors.repAccentGreen,
            //     fontSize: 12,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              specie.scientificName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                RiskChip(risk: specie.risk),
                const Spacer(),
                Icon(Icons.chevron_right, size: 20, color: Colors.white38),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
