import 'package:bio_tox/app/theme/app_colors.dart';
import 'package:bio_tox/core/features/files_manage/get_image_from_device.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Pantalla estática "Home" (modo claro) de BIOTOX.
/// Sin lógica: todos los datos están hardcodeados directamente en el widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildHeader(),
                    const SizedBox(height: 24),
                    _buildScanCard(),
                    const SizedBox(height: 28),
                    const Text(
                      'IDENTIFICACIONES RECIENTES',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildIdentificationCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTMBHOAQJ-DJJACkk3B7bjdA8yOnU9c3gvxdE-o4VBhw&s=10',
                      nombre: 'Cascabel Diamante',
                      nombreCientifico: 'Crotalus atrox',
                      fecha: 'Hoy, 10:24 AM',
                    ),
                    const SizedBox(height: 14),
                    _buildIdentificationCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0BOJczCwvA9Yg8YXC3xjP0D1LcjjbF9CwCintg999VMDp3-WQNlT7OhqIYyuFMse3QEq6ZbivxUwJz5RlLsAn4Q7puw9nP5KYn3YJ0w&s=10',
                      nombre: 'Terciopelo',
                      nombreCientifico: 'Bothrops asper',
                      fecha: 'Ayer, 16:45 PM',
                    ),
                    const SizedBox(height: 14),
                    _buildIdentificationCard(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS36b9iVvYCnJV57NFnzbooV6oC1VuDIpqBtp9LselFnw&s=10',
                      nombre: 'Coral Real',
                      nombreCientifico: 'Micrurus',
                      fecha: '12 Oct, 09:15 AM',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Header: avatar + saludo + botón SOS ----
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 47,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/usuario.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola, Usuario',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: AppColors.secundaryColor,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---- Tarjeta grande "Escanear Animal" ----
  Widget _buildScanCard() {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () async {
        await getImageFromDevice(ImageSource.camera);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 36),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.center_focus_weak,
                color: AppColors.primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'ESCANEAR ANIMAL',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---- Card de identificación reciente ----
  Widget _buildIdentificationCard({
    required String imageUrl,
    required String nombre,
    required String nombreCientifico,
    required String fecha,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagen (placeholder, reemplazar por Image.asset/Image.network)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDE9),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: CachedNetworkImageProvider(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  nombreCientifico,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  fecha,
                  style: const TextStyle(color: Colors.white38, fontSize: 11.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.repRed,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ALTO PELIGRO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9.5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
