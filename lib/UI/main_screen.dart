import 'package:bio_tox/UI/add_animal_screen/add_animal_screen.dart';
import 'package:bio_tox/UI/catalog_especies/catalog_especies.dart';
import 'package:bio_tox/UI/home_screen/home_screen.dart';
import 'package:bio_tox/UI/settings/settings_screen.dart';
import 'package:bio_tox/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    CatalogoEspeciesScreen(),
    AddAnimalScreen(),
    SettingsScreen(),
  ];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex],

      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.primaryColor,
        selectedIndex: currentScreenIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentScreenIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Inicio',
            selectedIcon: Icon(Icons.home, color: AppColors.background),
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Especies',
            selectedIcon: Icon(Icons.search, color: AppColors.background),
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Agregar',
            selectedIcon: Icon(Icons.add, color: AppColors.background),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Ajustes',
            selectedIcon: Icon(
              Icons.settings_outlined,
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
