import 'package:bio_tox/core/entities/sintoma.dart';
import 'package:bio_tox/core/entities/specie.dart';
import 'package:bio_tox/core/enum/risk.dart';
import 'package:flutter/material.dart';

final specieCatalogList = [
  // ─────────────────────────────────────────────
  // Bothrops atrox
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/bothrops_atrox/1.json',
      'assets/animals/bothrops_atrox/2.json',
    ],

    images: [
      AssetImage('assets/animals/bothrops_atrox/1.jpg'),
      AssetImage('assets/animals/bothrops_atrox/2.jpg'),
      AssetImage('assets/animals/bothrops_atrox/3.jpg'),
    ],

    commonName: 'Jergón',
    scientificName: 'Bothrops atrox',

    risk: Risk.alto,

    tipoDeVeneno: 'Hemotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor intenso en la zona de la mordedura',
        minMinutes: 5,
        maxMinutes: 30,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón en la zona afectada',
        minMinutes: 10,
        maxMinutes: 60,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Sangrado en la zona de la mordedura',
        minMinutes: 30,
        maxMinutes: 120,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Moretones y cambios de coloración de la piel',
        minMinutes: 60,
        maxMinutes: 240,
        color: Colors.purple,
      ),
      Sintoma(
        description: 'Ampollas en la zona afectada',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Náuseas y vómitos',
        minMinutes: 30,
        maxMinutes: 240,
        color: Colors.amber,
      ),
      Sintoma(
        description: 'Alteraciones de la coagulación y sangrado',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Necrosis del tejido',
        minMinutes: 120,
        maxMinutes: 1440,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica de emergencia inmediatamente',
      'Mantener a la persona tranquila y evitar movimientos innecesarios',
      'Inmovilizar la extremidad afectada',
      'Trasladar a la persona a un centro médico',
      'Administrar antiveneno específico bajo supervisión médica',
      'Controlar el sangrado y las alteraciones de la coagulación',
    ],

    genero: 'Bothrops',
    familia: 'Viperidae',
  ),

  // ─────────────────────────────────────────────
  // Bothrops bilineatus
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/bothrops_bilineatus/1.json',
      'assets/animals/bothrops_bilineatus/2.json',
    ],

    images: [
      AssetImage('assets/animals/bothrops_bilineatus/1.jpg'),
      AssetImage('assets/animals/bothrops_bilineatus/2.jpg'),
      AssetImage('assets/animals/bothrops_bilineatus/3.jpg'),
    ],

    commonName: 'Loro machaco',
    scientificName: 'Bothrops bilineatus',

    risk: Risk.alto,

    tipoDeVeneno: 'Hemotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor intenso en la zona de la mordedura',
        minMinutes: 5,
        maxMinutes: 30,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón y edema',
        minMinutes: 10,
        maxMinutes: 60,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Sangrado en la zona afectada',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Moretones y cambios de coloración',
        minMinutes: 60,
        maxMinutes: 240,
        color: Colors.purple,
      ),
      Sintoma(
        description: 'Alteraciones de la coagulación',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Necrosis del tejido',
        minMinutes: 120,
        maxMinutes: 1440,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica inmediatamente',
      'Mantener a la persona tranquila',
      'Inmovilizar la extremidad afectada',
      'Trasladar a la persona a un centro médico',
      'Administrar antiveneno cuando esté indicado',
      'Controlar el sangrado y las alteraciones de la coagulación',
    ],

    genero: 'Bothrops',
    familia: 'Viperidae',
  ),

  // ─────────────────────────────────────────────
  // Bothrops pictus
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/bothrops_pictus/1.json',
      'assets/animals/bothrops_pictus/2.json',
    ],

    images: [
      AssetImage('assets/animals/bothrops_pictus/1.jpg'),
      AssetImage('assets/animals/bothrops_pictus/2.jpg'),
      AssetImage('assets/animals/bothrops_pictus/3.jpg'),
      AssetImage('assets/animals/bothrops_pictus/4.jpg'),
      AssetImage('assets/animals/bothrops_pictus/5.jpg'),
    ],

    commonName: 'Jergón de la costa',
    scientificName: 'Bothrops pictus',

    risk: Risk.alto,

    tipoDeVeneno: 'Hemotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor intenso en el lugar de la mordedura',
        minMinutes: 5,
        maxMinutes: 30,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón progresiva',
        minMinutes: 10,
        maxMinutes: 120,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Sangrado local',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Moretones alrededor de la mordedura',
        minMinutes: 60,
        maxMinutes: 240,
        color: Colors.purple,
      ),
      Sintoma(
        description: 'Alteraciones de la coagulación',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Daño y necrosis del tejido',
        minMinutes: 120,
        maxMinutes: 1440,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica de emergencia',
      'Mantener a la persona tranquila',
      'Inmovilizar la extremidad afectada',
      'Trasladar inmediatamente a un centro médico',
      'Administrar antiveneno específico cuando esté indicado',
      'Controlar las alteraciones de la coagulación',
    ],

    genero: 'Bothrops',
    familia: 'Viperidae',
  ),

  // ─────────────────────────────────────────────
  // Bothrops taeniatus
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/bothrops_taeniatus/1.json',
      'assets/animals/bothrops_taeniatus/2.json',
      'assets/animals/bothrops_taeniatus/3.json',
      'assets/animals/bothrops_taeniatus/4.json',
    ],

    images: [
      AssetImage('assets/animals/bothrops_taeniatus/1.jpg'),
      AssetImage('assets/animals/bothrops_taeniatus/2.jpg'),
      AssetImage('assets/animals/bothrops_taeniatus/3.jpg'),
    ],

    commonName: 'Jergón',
    scientificName: 'Bothrops taeniatus',

    risk: Risk.alto,

    tipoDeVeneno: 'Hemotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor en el lugar de la mordedura',
        minMinutes: 5,
        maxMinutes: 30,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón y edema',
        minMinutes: 10,
        maxMinutes: 120,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Sangrado local',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Moretones y alteraciones de la piel',
        minMinutes: 60,
        maxMinutes: 240,
        color: Colors.purple,
      ),
      Sintoma(
        description: 'Alteraciones de la coagulación',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Daño tisular',
        minMinutes: 120,
        maxMinutes: 1440,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica inmediatamente',
      'Mantener a la persona tranquila',
      'Inmovilizar la extremidad afectada',
      'Trasladar a la persona a un centro médico',
      'Administrar antiveneno cuando esté indicado',
      'Realizar vigilancia médica de la coagulación y el daño tisular',
    ],

    genero: 'Bothrops',
    familia: 'Viperidae',
  ),

  // ─────────────────────────────────────────────
  // Lachesis
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/lachesis/1.json',
      'assets/animals/lachesis/2.json',
      'assets/animals/lachesis/3.json',
    ],

    images: [
      AssetImage('assets/animals/lachesis/1.jpg'),
      AssetImage('assets/animals/lachesis/2.jpg'),
      AssetImage('assets/animals/lachesis/3.jpg'),
    ],

    commonName: 'Shushupe',
    scientificName: 'Lachesis',

    risk: Risk.alto,

    tipoDeVeneno: 'Hemotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor intenso en la zona de la mordedura',
        minMinutes: 5,
        maxMinutes: 30,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón intensa',
        minMinutes: 10,
        maxMinutes: 120,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Sangrado',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Moretones y alteraciones de la piel',
        minMinutes: 60,
        maxMinutes: 240,
        color: Colors.purple,
      ),
      Sintoma(
        description: 'Náuseas, vómitos y dolor abdominal',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.amber,
      ),
      Sintoma(
        description: 'Alteraciones de la presión arterial',
        minMinutes: 30,
        maxMinutes: 180,
        color: Colors.blue,
      ),
      Sintoma(
        description: 'Alteraciones de la coagulación',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Necrosis y daño tisular',
        minMinutes: 120,
        maxMinutes: 1440,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica de emergencia inmediatamente',
      'Mantener a la persona tranquila y evitar movimientos innecesarios',
      'Inmovilizar la extremidad afectada',
      'Trasladar inmediatamente a un centro hospitalario',
      'Administrar antiveneno específico cuando esté indicado',
      'Monitorizar signos vitales y alteraciones de la coagulación',
    ],

    genero: 'Lachesis',
    familia: 'Viperidae',
  ),

  // ─────────────────────────────────────────────
  // Micrurus
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/micrurus/1.json',
      'assets/animals/micrurus/2.json',
      'assets/animals/micrurus/3.json',
    ],

    images: [
      AssetImage('assets/animals/micrurus/1.jpg'),
      AssetImage('assets/animals/micrurus/2.jpg'),
      AssetImage('assets/animals/micrurus/3.jpg'),
    ],

    commonName: 'Coral',
    scientificName: 'Micrurus',

    risk: Risk.alto,

    tipoDeVeneno: 'Neurotóxico',

    sintomas: [
      Sintoma(
        description: 'Dolor o sensación anormal en la zona de la mordedura',
        minMinutes: 15,
        maxMinutes: 120,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hormigueo y adormecimiento',
        minMinutes: 15,
        maxMinutes: 120,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Debilidad muscular',
        minMinutes: 30,
        maxMinutes: 240,
        color: Colors.amber,
      ),
      Sintoma(
        description: 'Párpados caídos',
        minMinutes: 30,
        maxMinutes: 240,
        color: Colors.blue,
      ),
      Sintoma(
        description: 'Dificultad para hablar o tragar',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Dificultad respiratoria',
        minMinutes: 60,
        maxMinutes: 360,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Parálisis muscular',
        minMinutes: 120,
        maxMinutes: 480,
        color: Colors.black,
      ),
    ],

    tratamientos: [
      'Buscar atención médica de emergencia inmediatamente',
      'Mantener a la persona tranquila y evitar movimientos innecesarios',
      'Trasladar inmediatamente a un centro hospitalario',
      'Administrar antiveneno específico cuando esté indicado',
      'Monitorizar continuamente la respiración',
      'Proporcionar soporte respiratorio si es necesario',
    ],

    genero: 'Micrurus',
    familia: 'Elapidae',
  ),

  // ─────────────────────────────────────────────
  // Pseudalsophis elegans
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/pseudalsophis_elegans/1.json',
      'assets/animals/pseudalsophis_elegans/2.json',
      'assets/animals/pseudalsophis_elegans/3.json',
    ],

    images: [
      AssetImage('assets/animals/pseudalsophis_elegans/1.jpg'),
      AssetImage('assets/animals/pseudalsophis_elegans/2.jpg'),
      AssetImage('assets/animals/pseudalsophis_elegans/3.jpg'),
    ],

    commonName: 'Culebra elegante',
    scientificName: 'Pseudalsophis elegans',

    risk: Risk.bajo,

    tipoDeVeneno: 'No venenoso',

    sintomas: [
      Sintoma(
        description: 'Dolor localizado por la mordedura',
        minMinutes: 1,
        maxMinutes: 30,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Enrojecimiento de la zona afectada',
        minMinutes: 5,
        maxMinutes: 60,
        color: Colors.red,
      ),
      Sintoma(
        description: 'Hinchazón leve',
        minMinutes: 10,
        maxMinutes: 120,
        color: Colors.orange,
      ),
    ],

    tratamientos: [
      'Lavar la zona de la mordedura con agua y jabón',
      'Mantener la herida limpia',
      'Observar signos de infección',
      'Buscar atención médica si la herida es profunda o presenta signos de infección',
    ],

    genero: 'Pseudalsophis',
    familia: 'Colubridae',
  ),

  // ─────────────────────────────────────────────
  // Pseudoboa coronata
  // ─────────────────────────────────────────────
  Specie(
    embedingAssets: [
      'assets/animals/pseudoboa_ncoronata/1.json',
      'assets/animals/pseudoboa_ncoronata/2.json',
      'assets/animals/pseudoboa_ncoronata/3.json',
      'assets/animals/pseudoboa_ncoronata/4.json',
    ],

    images: [
      AssetImage('assets/animals/pseudoboa_ncoronata/1.jpg'),
      AssetImage('assets/animals/pseudoboa_ncoronata/2.jpg'),
      AssetImage('assets/animals/pseudoboa_ncoronata/3.jpg'),
    ],

    commonName: 'Falsa coral',
    scientificName: 'Pseudoboa coronata',

    risk: Risk.bajo,

    tipoDeVeneno: 'Levemente venenoso',

    sintomas: [
      Sintoma(
        description: 'Dolor localizado',
        minMinutes: 1,
        maxMinutes: 30,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Hinchazón leve en la zona afectada',
        minMinutes: 10,
        maxMinutes: 120,
        color: Colors.orange,
      ),
      Sintoma(
        description: 'Enrojecimiento de la piel',
        minMinutes: 5,
        maxMinutes: 60,
        color: Colors.red,
      ),
    ],

    tratamientos: [
      'Lavar la zona afectada con agua y jabón',
      'Mantener la herida limpia',
      'Evitar manipular o presionar la herida',
      'Buscar atención médica si aparecen síntomas importantes o signos de infección',
    ],

    genero: 'Pseudoboa',
    familia: 'Colubridae',
  ),
];
