import 'package:bio_tox/core/const/mock_sintomas_list.dart';
import 'package:bio_tox/core/entities/specie.dart';
import 'package:flutter/material.dart';

/// Pantalla estática "Catálogo de Especies" (BIOTOX).
/// Sin lógica: todos los datos están hardcodeados directamente en el widget.
class CatalogoEspeciesScreen extends StatelessWidget {
  const CatalogoEspeciesScreen({super.key});

  static const Color kBackground = Color(0xFF0B0F0A);
  static const Color kAccent = Color(0xFFD3FF5C); // verde lima
  static const Color kCardBackground = Color(0xFF161C13);
  static const Color kCardBorder = Color(0xFF262E1E);
  static const Color kChipBackground = Color(0xFF1B2115);
  static const Color kNavBackground = Color(0xFF10140D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálogo de Especies')),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 16),
                  _buildFilterChips(),
                  const SizedBox(height: 20),
                  const Text(
                    'Catálogo de Especies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildGrid(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---- Barra de búsqueda (visual, sin lógica) ----

  Widget _buildSearchBar() {
    return SearchBar(
      hintText: 'Buscar...',
      hintStyle: const WidgetStatePropertyAll(
        TextStyle(color: Colors.white38, fontSize: 14),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: const Icon(Icons.search, color: Colors.white38, size: 20),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      backgroundColor: WidgetStatePropertyAll(kCardBackground),
      onChanged: (value) {
        // Buscar
      },
    );
  }

  // ---- Chips de filtro por categoría ----
  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterChip('🐍', 'Serpientes', selected: true),
          const SizedBox(width: 10),
          _filterChip('🕷️', 'Arañas', selected: false),
          const SizedBox(width: 10),
          _filterChip('🦂', 'Escorpiones', selected: false),
        ],
      ),
    );
  }

  Widget _filterChip(String emoji, String label, {required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        color: selected ? kAccent : kChipBackground,
        borderRadius: BorderRadius.circular(20),
        border: selected ? null : Border.all(color: kCardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ---- Grid de especies (2 columnas) ----
  Widget _buildGrid() {
    final especies = latamVenomousSpecies;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: especies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => _buildSpeciesCard(especies[index]),
    );
  }

  Widget _buildSpeciesCard(Specie especie) {
    return Container(
      decoration: BoxDecoration(
        color: kCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kCardBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen (placeholder, reemplazar por Image.asset/Image.network)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2E3620), Color(0xFF161C13)],
                ),

                image: DecorationImage(
                  image: especie.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  especie.scientificName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  especie.commonName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: especie.risk.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    especie.risk.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
