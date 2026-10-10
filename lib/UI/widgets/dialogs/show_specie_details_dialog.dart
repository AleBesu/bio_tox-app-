import 'package:bio_tox/UI/widgets/custom_image_widget.dart';
import 'package:bio_tox/UI/widgets/risk_chip.dart';
import 'package:bio_tox/app/theme/app_colors.dart';
import 'package:bio_tox/core/entities/specie.dart';
import 'package:flutter/material.dart';

Future<void> showSpecieDetailsDialog(
  BuildContext context, {
  required Specie specie,
}) async {
  await showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: AppColors.cardBackground,
      insetPadding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 24),
        child: _SpeciesDetailsBody(specie: specie),
      ),
    ),
  );
}

class _SpeciesDetailsBody extends StatelessWidget {
  const _SpeciesDetailsBody({required this.specie});
  final Specie specie;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RiskChip(risk: specie.risk),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    specie.commonName,
                    style: text.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    specie.scientificName,
                    style: text.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            IconButton.filledTonal(
              color: AppColors.secundaryColor,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              padding: EdgeInsets.all(4),
              iconSize: 17,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.86),
            padEnds: false,
            itemCount: specie.images.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CustomImageWidget(image: specie.images[i]),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Text(
        //   'DESLIZA PARA VER MÁS FOTOS',
        //   style: text.labelSmall?.copyWith(
        //     color: Colors.white38,
        //     letterSpacing: 1.4,
        //   ),
        // ),
        // const Divider(height: 40),

        Card(
          color: const Color.fromARGB(219, 32, 28, 20),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(
              color: Color.fromARGB(227, 255, 173, 85).withOpacity(.15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0x1AFF9D42),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        size: 16,
                        color: Color(0xFFFFB267),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Posibles síntomas',
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                //sintomes list
                ...specie.sintomas.map((s) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 16,
                    leading: const Icon(
                      Icons.circle,
                      size: 6,
                      color: Color(0xFFFFAD55),
                    ),
                    title: Text(
                      s.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),
        Card(
          color: const Color(0xFF142019),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(color: AppColors.repAccentGreen.withOpacity(.15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: AppColors.repAccentGreen,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Protocolo de Tratamiento',
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                for (final (i, step) in specie.tratamientos.indexed)
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.circle,
                      size: 6,
                      color: AppColors.repAccentGreen,
                    ),
                    title: Text(
                      step,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
