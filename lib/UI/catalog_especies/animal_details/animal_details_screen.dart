import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Pantalla estática de detalle de especie venenosa.
/// Sin lógica: todos los datos están hardcodeados directamente en el widget.
class AnimalDetalleScreen extends StatelessWidget {
  const AnimalDetalleScreen({super.key});

  static const Color kBackground = Color(0xFF0B0F0A);
  static const Color kAccent = Color(0xFFD3FF5C); // verde lima
  static const Color kCardBackground = Color(0xFF161C13);
  static const Color kCardBorder = Color(0xFF2A331F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 20),
                  _buildTaxonomiaCard(),
                  const SizedBox(height: 28),
                  _buildSectionTitle(
                    'SÍNTOMAS',
                    button: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kAccent,
                      ),
                      child: Icon(Icons.history, color: kBackground),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBulletList(const [
                    'Dolor e inflamación intensa',
                    'Necrosis tisular',
                    'Hemorragia local y sistémica',
                    'Coagulopatía',
                    'Insuficiencia renal',
                  ]),
                  const SizedBox(height: 28),
                  _buildSectionTitle('PROTOCOLO DE TRATAMIENTO'),
                  const SizedBox(height: 12),
                  _buildBulletList(const [
                    'Suero antiofídico polivalente INS-Perú',
                    'Inmovilizar la extremidad afectada',
                    'Traslado urgente a centro de salud MINSA',
                    'Monitoreo de coagulación',
                  ]),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Hero image con botones flotantes ----
  Widget _buildHeroImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo (reemplazar por Image.asset/Image.network real)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  'https://www.cam.ac.uk/sites/default/files/shorthand/stories/KyJGTQGuZA/2026-03-06T15:47:14.208Z/assets/JNBvif6q0t/3.-anaconda-credit-andres-alfonso-rojascrop-2560x1440.jpg',
                ),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF3D4A2E), Color(0xFF0B0F0A)],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                color: Colors.white24,
                size: 48,
              ),
            ),
          ),
          // Degradado inferior para legibilidad
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  kBackground.withOpacity(0.9),
                  kBackground,
                ],
                stops: const [0.4, 0.85, 1.0],
              ),
            ),
          ),
          // Botón atrás y guardar
          Positioned(
            top: 8,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleIconButton(Icons.arrow_back),
                _circleIconButton(Icons.bookmark_border),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  // ---- Título y subtítulo ----
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bothrops atrox',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Jergón de la Selva',
          style: TextStyle(
            color: kAccent,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ---- Card de taxonomía ----
  Widget _buildTaxonomiaCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kCardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TAXONOMÍA',
            style: TextStyle(
              color: kAccent,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 14),
          _taxonomiaRow('Familia:', 'Viperidae'),
          const SizedBox(height: 8),
          _taxonomiaRow('Género:', 'Bothrops'),
          const SizedBox(height: 8),
          _taxonomiaRow('Veneno:', 'Hemotóxico / Proteolítico'),
        ],
      ),
    );
  }

  Widget _taxonomiaRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.white70),
        children: [
          TextSpan(text: '$label '),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ---- Títulos de sección ----
  Widget _buildSectionTitle(String text, {Widget? button}) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: kAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        SizedBox(width: 8),
        if (button != null) button,
      ],
    );
  }

  // ---- Lista con bullets ----
  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: kAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
