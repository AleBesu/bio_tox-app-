import 'package:flutter/material.dart';

/// Pantalla estática "Mi Perfil" de BIOTOX.
/// Sin lógica: todos los valores (switches, campos) están fijos, no hay estado.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const Color kBackground = Color(0xFF0B0F0A);
  static const Color kAccent = Color(0xFFCFFF3D); // verde lima
  static const Color kCardBackground = Color(0xFF161C13);
  static const Color kCardBorder = Color(0xFF262E1E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text('AJUSTES'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode, color: Colors.white),
            onPressed: () => {},
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            const SizedBox(height: 32),
            _buildAvatar(),
            const SizedBox(height: 32),
            _buildNameField(),
            const SizedBox(height: 20),
            _buildSaveButton(),
            const SizedBox(height: 28),
            const Divider(color: Color(0xFF262E1E), height: 1),
            const SizedBox(height: 24),
            _buildSectionTitle('PREFERENCIAS'),
            const SizedBox(height: 12),
            _buildPreferencesCard(),

            const SizedBox(height: 24),

            _buildSectionTitle('DATOS OFFLINE'),
            const SizedBox(height: 10),
            _buildDatosOfflineCard(),
            const SizedBox(height: 24),
            _buildInformacionCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ---- Avatar circular con iniciales ----
  Widget _buildAvatar() {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: kAccent, width: 2),
        ),
        child: const Center(
          child: Text(
            'AF',
            style: TextStyle(
              color: kAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ---- Campo de nombre (visual, sin lógica) ----
  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TU NOMBRE',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
          ),
        ),

        TextFormField(
          initialValue: 'Usuario',
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: kAccent, width: 2),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kAccent, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kAccent, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Cómo quieres que te saludemos',
          style: TextStyle(color: Colors.white38, fontSize: 12.5),
        ),
      ],
    );
  }

  // ---- Botón "Guardar nombre" ----
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          backgroundColor: kAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () => {},
        child: Text(
          'GUARDAR NOMBRE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }

  // ---- Título de sección ----
  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: kAccent,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.6,
      ),
    );
  }

  // ---- Card de preferencias ----
  Widget _buildPreferencesCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kCardBorder),
      ),
      child: Column(
        children: [
          _buildSwitchRow('Notificaciones de alerta', value: true),
          const Divider(color: Color(0xFF232B1A), height: 1),

          const Divider(color: Color(0xFF232B1A), height: 1),
          _buildUnitRow(),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String label, {required bool value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          // Switch puramente visual (sin onChanged real / sin estado)
          Switch(
            value: false,

            trackColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return kAccent;
              } else {
                return kCardBackground;
              }
            }),
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return kCardBackground;
              }
              return Colors.grey;
            }),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  // ---- Fila con texto secundario y chevron opcional ----
  Widget _buildChevronRow(
    String label, {
    String? trailingText,
    bool showChevron = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          Row(
            children: [
              if (trailingText != null)
                Text(
                  trailingText,
                  style: const TextStyle(color: Colors.white38, fontSize: 14),
                ),
              if (showChevron) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white24,
                  size: 20,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnitRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Unidades de distancia',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 35,
            child: ToggleButtons(
              isSelected: const [true, false],
              onPressed: (index) {},
              selectedColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              children: const [
                Text(
                  'KM',
                  style: TextStyle(
                    color: kAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('MI', style: TextStyle(color: Colors.white, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---- Sección Datos Offline ----
  Widget _buildDatosOfflineCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kCardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Descargar para offline',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'ACTUALIZAR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Barra de progreso fija (visual, sin lógica)
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 6,
              child: Stack(
                children: [
                  Container(color: const Color(0xFF262E1E)),
                  FractionallySizedBox(
                    widthFactor: 0.65,
                    child: Container(color: kAccent),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sincronizando especies... 65%',
            style: TextStyle(color: Colors.white38, fontSize: 12.5),
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF232B1A), height: 1),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Almacenamiento utilizado',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                '234 MB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---- Sección Información ----
  Widget _buildInformacionCard() {
    return _cardWrapper(
      children: [
        _buildChevronRow('Versión', trailingText: '2.4.12', showChevron: false),
        const Divider(color: Color(0xFF232B1A), height: 1),
        _buildChevronRow('Acerca de Biotox'),
        const Divider(color: Color(0xFF232B1A), height: 1),
        _buildChevronRow('Compartir App'),
      ],
    );
  }

  Widget _cardWrapper({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kCardBorder),
      ),
      child: Column(children: children),
    );
  }
}
