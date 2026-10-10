// import 'package:bio_tox/core/entities/sintoma.dart';
// import 'package:bio_tox/core/entities/specie.dart';
// import 'package:bio_tox/core/enum/risk.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// // Asegúrate de importar tus clases correctamente
// // import 'package:bio_tox/core/entities/specie.dart';
// // import 'package:bio_tox/core/entities/sintoma.dart';
// // import 'package:bio_tox/core/enum/danger_level.dart';

// final List<Specie> latamVenomousSpecies = [
//   Specie(
//     embeddings: [],
//     commonName: 'Rana Dorada Venenosa',
//     scientificName: 'Phyllobates terribilis',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Batracotoxina (Neurotóxico)',
//     genero: 'Phyllobates',
//     familia: 'Dendrobatidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://upload.wikimedia.org/wikipedia/commons/6/6e/Schrecklicherpfeilgiftfrosch-01.jpg',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Contracciones musculares y parálisis',
//         color: Colors.red,
//         minMinutes: 2,
//         maxMinutes: 10,
//       ),
//       Sintoma(
//         description: 'Fallo cardíaco y fibrilación',
//         color: Colors.purple,
//         minMinutes: 10,
//         maxMinutes: 30,
//       ),
//     ],
//     tratamientos: [
//       'No existe antídoto específico',
//       'Soporte vital inmediato',
//       'Evitar contacto directo a toda costa',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Araña Errante Brasileña',
//     scientificName: 'Phoneutria nigriventer',
//     risk: Risk.alto,
//     tipoDeVeneno: 'PhTx3 (Neurotóxico)',
//     genero: 'Phoneutria',
//     familia: 'Ctenidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq3HW3ymcrPeFu2KX77XQR9p3za2vp2wx8MUpILapF5w&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Dolor intenso localizado',
//         color: Colors.orange,
//         minMinutes: 1,
//         maxMinutes: 15,
//       ),
//       Sintoma(
//         description: 'Taquicardia, salivación y priapismo',
//         color: Colors.red,
//         minMinutes: 30,
//         maxMinutes: 120,
//       ),
//     ],
//     tratamientos: [
//       'Administración de antiveneno Phoneutria',
//       'Analgésicos potentes',
//       'Control de presión arterial',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Serpiente Terciopelo',
//     scientificName: 'Bothrops asper',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Hemotóxico y Miotóxico',
//     genero: 'Bothrops',
//     familia: 'Viperidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYQR9_laShY90zdXEOMfUcpbLWm7FHf8u2ElKROG0hkQ&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Edema severo y sangrado local',
//         color: Colors.red,
//         minMinutes: 10,
//         maxMinutes: 60,
//       ),
//       Sintoma(
//         description: 'Necrosis y hemorragia sistémica',
//         color: Colors.black87,
//         minMinutes: 60,
//         maxMinutes: 360,
//       ),
//     ],
//     tratamientos: [
//       'Suero antiofídico polivalente',
//       'Terapia de reemplazo de fluidos',
//       'Desbridamiento de tejido necrótico',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Araña de Rincón',
//     scientificName: 'Loxosceles laeta',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Esfingomielinasa D (Necrotóxico)',
//     genero: 'Loxosceles',
//     familia: 'Sicariidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuBwW9rufAklIK3BMK1kf1yIhV5whhMPOxCUswQlh19A&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Dolor punzante leve y enrojecimiento',
//         color: Colors.yellow,
//         minMinutes: 15,
//         maxMinutes: 120,
//       ),
//       Sintoma(
//         description: 'Placa livedoide y necrosis extensa',
//         color: Colors.black,
//         minMinutes: 720,
//         maxMinutes: 1440,
//       ),
//     ],
//     tratamientos: [
//       'Suero antiloxoscélico (si es temprano)',
//       'Corticoides sistémicos',
//       'Cirugía reconstructiva posterior',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Cascabel Tropical',
//     scientificName: 'Crotalus durissus',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Neurotóxico y Miotóxico',
//     genero: 'Crotalus',
//     familia: 'Viperidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwwnqvsjyQXGxT-KOIFIaO_fy6DYRddyli0vjM7fVM3A&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Ptosis palpebral (párpados caídos)',
//         color: Colors.blue,
//         minMinutes: 30,
//         maxMinutes: 120,
//       ),
//       Sintoma(
//         description: 'Dolor muscular generalizado y orina oscura',
//         color: Colors.red,
//         minMinutes: 120,
//         maxMinutes: 360,
//       ),
//     ],
//     tratamientos: [
//       'Suero crotálico',
//       'Hidratación intravenosa agresiva',
//       'Diálisis en caso de fallo renal',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Escorpión Amarillo Brasileño',
//     scientificName: 'Tityus serrulatus',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Neurotóxico',
//     genero: 'Tityus',
//     familia: 'Buthidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTarqAEVvwEnZYOM8kObRve7qjnNm_j6vn7HDtKO3CPmw&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Dolor lacerante irradiado',
//         color: Colors.orange,
//         minMinutes: 1,
//         maxMinutes: 30,
//       ),
//       Sintoma(
//         description: 'Sudoración, vómitos y edema pulmonar',
//         color: Colors.red,
//         minMinutes: 30,
//         maxMinutes: 180,
//       ),
//     ],
//     tratamientos: [
//       'Suero antiescorpiónico',
//       'Bloqueo anestésico local',
//       'Soporte ventilatorio',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Hormiga Bala',
//     scientificName: 'Paraponera clavata',
//     risk: Risk.medio,
//     tipoDeVeneno: 'Poneratoxina (Neurotóxico)',
//     genero: 'Paraponera',
//     familia: 'Paraponeridae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWkHCVK-2GE4PmopgRZSNQy6wN585jUUI44kvcorYsNw&s=10',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Dolor insoportable comparado con un disparo',
//         color: Colors.red,
//         minMinutes: 0,
//         maxMinutes: 5,
//       ),
//       Sintoma(
//         description: 'Inflamación local y fiebre',
//         color: Colors.orange,
//         minMinutes: 60,
//         maxMinutes: 1440,
//       ),
//     ],
//     tratamientos: [
//       'Compresas frías',
//       'Analgésicos fuertes',
//       'Antihistamínicos',
//     ],
//   ),
//   Specie(
//     embeddings: [],
//     commonName: 'Serpiente Coral',
//     scientificName: 'Micrurus lemniscatus',
//     risk: Risk.alto,
//     tipoDeVeneno: 'Neurotóxico potente',
//     genero: 'Micrurus',
//     familia: 'Elapidae',
//     images: [
//       CachedNetworkImageProvider(
//         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTLyrxbGm6kErhbLqTZNdwCkkF0kG805V0hwayOiCLlQ&s',
//       ),
//     ],
//     sintomas: [
//       Sintoma(
//         description: 'Adormecimiento local leve',
//         color: Colors.yellow,
//         minMinutes: 5,
//         maxMinutes: 30,
//       ),
//       Sintoma(
//         description: 'Parálisis respiratoria',
//         color: Colors.purple,
//         minMinutes: 60,
//         maxMinutes: 240,
//       ),
//     ],
//     tratamientos: [
//       'Suero anticoral',
//       'Respiración artificial temprana',
//       'Monitoreo en UCI',
//     ],
//   ),
// ];
