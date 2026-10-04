import 'package:bio_tox/core/entities/sintoma.dart';
import 'package:flutter/material.dart';

/// Pantalla estática "Línea de Síntomas".
/// Sin lógica: todos los datos están hardcodeados directamente en el widget.
class SintomasTimelineScreen extends StatelessWidget {
  final List<Sintoma> sintomasList;
  const SintomasTimelineScreen({super.key, required this.sintomasList});

  static const Color kBackground = Color(0xFF0B0F0A);
  static const Color kAccent = Color(0xFFD3FF5C); // verde lima
  static const Color kCardBackground = Color(0xFF161C13);
  static const Color kCardBorder = Color(0xFF262E1E);
  static const Color kNavBackground = Color(0xFF10140D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildBadgeRow(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...sintomasList
                          .map(
                            (sintoma) => _buildTimelineItem(sintoma: sintoma),
                          )
                          .toList(),

                      const SizedBox(height: 16),
                      const Text(
                        'Esta información es orientativa. Busque atención médica inmediata.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Header ----
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF1B2115),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Text(
            'LÍNEA DE SÍNTOMAS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  // ---- Badge especie ----
  Widget _buildBadgeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: kAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'BOTHROPS ATROX',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Jergón de la selva',
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ---- Item del timeline con línea vertical y punto ----
  Widget _buildTimelineItem({required Sintoma sintoma}) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kCardBackground,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: kCardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${sintoma.minTime}-${sintoma.maxTime}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: sintoma.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                sintoma.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13.5,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
