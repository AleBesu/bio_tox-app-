import 'package:bio_tox/UI/main_screen.dart';
import 'package:flutter/material.dart';

/// Pantalla estática "Splash / Bienvenida" de BIOTOX.
/// Sin lógica: no hay navegación, timers ni controllers.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const Color kBackground = Colors.black;
  static const Color kAccent = Color(0xFFB6FF1F);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // verde lima
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SplashScreen.kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 4),
              _buildLogo(),
              const Spacer(flex: 5),
              _buildTagline(),
              const SizedBox(height: 24),
              _buildStartButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Logo: ícono + wordmark ----
  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ícono placeholder — reemplazar por el logo real (Image.asset con el SVG/PNG de la serpiente).
        Image.asset('assets/icons/app_icon.png', width: 100, height: 134),

        const Text(
          'BIOTOX',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }

  // ---- Tagline ----
  Widget _buildTagline() {
    return const Text(
      'Identifica. Advierte. Cuida y\nSobrevive.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SplashScreen.kAccent,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.4,
      ),
    );
  }

  // ---- Botón "Empezar ahora" ----
  Widget _buildStartButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        // Sin lógica: onPressed vacío, listo para conectar la navegación.
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: SplashScreen.kAccent,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EMPEZAR AHORA',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.black, size: 18),
          ],
        ),
      ),
    );
  }
}
