import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bio_tox/UI/scanner/scanner_result_screen.dart';
import 'package:bio_tox/UI/widgets/dialogs/loading_screen.dart';
import 'package:bio_tox/app/theme/app_colors.dart';

import 'package:bio_tox/core/entities/specie.dart';
import 'package:bio_tox/core/features/files_manage/cropper_image.dart';
import 'package:bio_tox/core/features/files_manage/get_image_from_device.dart';
import 'package:bio_tox/core/features/files_manage/image_procesor.dart';
import 'package:bio_tox/core/features/scanner_handler/scanner_handler.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_background_remover/image_background_remover.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:ultralytics_yolo/yolo.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool isLoadingCamera = true;
  bool isScanning = false;
  // YOLO yolo = YOLO(
  //   modelPath: 'assets/models/yolo26x_w8a32.tflite',
  //   task: YOLOTask.segment,
  // );

  FileImage? imageToScan;

  CameraController? _cameraController;
  List<CameraDescription> _cameras = [];

  @override
  void initState() {
    initCamera();
    super.initState();
    BackgroundRemover.instance.initializeOrt();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    BackgroundRemover.instance.initializeOrt();
    super.dispose();
  }

  Timer? scannerDebounce;

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      _cameras.first,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    await _cameraController!.initialize();

    if (!mounted) {
      return;
    }
    setState(() {
      isLoadingCamera = false;
    });

    _cameraController!.startImageStream((image) {
      if (scannerDebounce == null) {
        scannerDebounce = Timer(Duration(milliseconds: 500), () {
          scannerDebounce = null;
        });
      }
    });
  }

  // Future<FileImage?> removeBackground(File imageFile) async {
  //   //set object detecte TExt
  //   final result = await yolo.predict(await imageFile.readAsBytes());
  //   print("");
  //   // setState(() {
  //   //   cropDetection(imageBytes: image!.file.readAsBytesSync(), x: result, y: y, width: width, height: height)
  //   // });
  //   final detections = (result["detections"] as List);
  //   if (detections.isEmpty) {
  //     return null;
  //   }

  //   final Map<String, dynamic> boxBounds = (detections)[0]["boundingBox"];

  //   final imageNewFile = File(
  //     "${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.png",
  //   );

  //   setState(() {
  //     imageToScan = FileImage(imageNewFile);
  //     // objectData = result["detections"][0]["name"];
  //   });

  //   return imageToScan!;
  // }

  Uint8List cropToScreenRect({
    required Uint8List imageBytes,
    required Size screenSize,
    required Size previewSize, // _cameraController.value.previewSize
  }) {
    final image = img.decodeImage(imageBytes)!;

    // El preview se muestra rotado (portrait): swap width/height
    final previewW = previewSize.height;
    final previewH = previewSize.width;

    final scale = [
      screenSize.width / previewW,
      screenSize.height / previewH,
    ].reduce((a, b) => a > b ? a : b); // BoxFit.cover usa el mayor

    final scaledW = previewW * scale;
    final scaledH = previewH * scale;
    final offsetX = (scaledW - screenSize.width) / 2;
    final offsetY = (scaledH - screenSize.height) / 2;

    final rectSize = screenSize.width * 0.8;
    final rectLeft = (screenSize.width - rectSize) / 2 + offsetX;
    final rectTop = (screenSize.height - rectSize) / 2 + offsetY;

    // Coordenadas reales en el preview sin escalar
    final previewLeft = rectLeft / scale;
    final previewTop = rectTop / scale;
    final previewRectSize = rectSize / scale;

    // Escalar de previewSize -> tamaño real de la imagen capturada
    final imgScaleX = image.width / previewW;
    final imgScaleY = image.height / previewH;

    final cropped = img.copyCrop(
      image,
      x: (previewLeft * imgScaleX).round().clamp(0, image.width - 1),
      y: (previewTop * imgScaleY).round().clamp(0, image.height - 1),
      width: (previewRectSize * imgScaleX).round(),
      height: (previewRectSize * imgScaleY).round(),
    );

    return Uint8List.fromList(img.encodePng(cropped));
  }

  Future<List<Specie>> scanAnimalDetailed(FileImage imageFile) async {
    //remove backgroud

    FileImage? procesedImage;

    if (removeBackground) {
      procesedImage = await ImageProcesor.removeBackground(imageFile);
    }

    //scann photo
    final pickedEmbedings = await ScannerHandler.getEmbedingFromImage(
      img.decodeImage(
        (procesedImage != null ? procesedImage : imageFile).file
            .readAsBytesSync(),
      )!,
    );
    //scanner results
    final results = await ScannerHandler.searchAnimal(pickedEmbedings);

    if (results.isEmpty) {
      throw ("No se detectó ningún animal en la imagen");
    }

    return results;
  }

  bool removeBackground = false;

  @override
  Widget build(BuildContext context) {
    if (isLoadingCamera) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      // color: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: _cameraController == null
                ? Text("Error cargando la camara")
                : FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _cameraController!.value.previewSize!.height,
                      height: _cameraController!.value.previewSize!.width,
                      child: CameraPreview(_cameraController!),
                    ),
                  ),
          ),

          Positioned.fill(child: const ScannerOverlay()),

          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: const Text(
                        'Escanea el animal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 14),

                    isScanning
                        ? const CircularProgressIndicator()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreenAccent,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isScanning = true;
                                  });
                                  //get the image from the camera
                                  final pickedImage = await _cameraController!
                                      .takePicture();

                                  final imageFile = File(pickedImage.path);

                                  //scann photo
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoadingScreen(
                                        functionToLoad: () async {
                                          try {
                                            //get the image from the camera and crop
                                            final scannedImage =
                                                await cropToScreenRect(
                                                  imageBytes: imageFile
                                                      .readAsBytesSync(),
                                                  screenSize: MediaQuery.of(
                                                    context,
                                                  ).size,
                                                  previewSize:
                                                      _cameraController!
                                                          .value
                                                          .previewSize!,
                                                );
                                            //save the image
                                            imageFile.writeAsBytesSync(
                                              scannedImage,
                                            );

                                            setState(() {
                                              imageToScan = FileImage(
                                                imageFile,
                                              );
                                            });

                                            final resultsDetailed =
                                                await scanAnimalDetailed(
                                                  FileImage(imageFile),
                                                );

                                            await Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ScannerResultScreen(
                                                      similiarSpecies:
                                                          resultsDetailed,
                                                      scannedImage: FileImage(
                                                        imageFile,
                                                      ),
                                                    ),
                                              ),
                                            );
                                          } catch (e) {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                // margin: EdgeInsets.all(24),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor: Colors.red,
                                                width: 180,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 0.0,
                                                    ),
                                                content: Center(
                                                  child: Text(
                                                    'No se encontraron resultados',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        onComplete: () {},
                                      ),
                                    ),
                                  );

                                  setState(() {
                                    isScanning = false;
                                  });
                                },
                                child: const Text(
                                  'ESCANEAR',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 6,
            top: 6,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        removeBackground = !removeBackground;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.auto_fix_high,
                        color: removeBackground
                            ? AppColors.primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.collections),
                  color: Colors.white,
                  onPressed: () async {
                    _cameraController?.pausePreview();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingScreen(
                          functionToLoad: () async {
                            //pick the image from the gallery
                            final pickedImage = await getImageFromDevice(
                              ImageSource.gallery,
                            );

                            if (pickedImage != null) {
                              //crop the image
                              final croppedImage = await croppeImage(
                                pickedImage,
                                radioX: 1,
                                radioY: 1,
                              );

                              if (croppedImage != null) {
                                setState(() {
                                  imageToScan = croppedImage;
                                });
                                final similiarSpecies =
                                    await scanAnimalDetailed(
                                      FileImage(croppedImage.file),
                                    );

                                //!go to the result screen
                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScannerResultScreen(
                                      similiarSpecies: similiarSpecies,
                                      scannedImage: croppedImage,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    );

                    _cameraController?.resumePreview();
                  },
                ),

                SizedBox(width: 2),
              ],
            ),
          ),

          Positioned(
            left: 6,
            top: 6,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlay extends StatefulWidget {
  const ScannerOverlay({super.key});

  @override
  State<ScannerOverlay> createState() => _ScannerOverlayState();
}

class _ScannerOverlayState extends State<ScannerOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ScannerPainter(progress: _controller.value),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class ScannerPainter extends CustomPainter {
  final double progress;

  ScannerPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final scanRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.8,
      height: size.width * 0.8,
    );

    // =========================
    // OVERLAY OSCURO
    // =========================

    final overlayPaint = Paint()..color = Colors.black.withOpacity(0.6);

    final background = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final hole = Path()
      ..addRRect(RRect.fromRectAndRadius(scanRect, const Radius.circular(16)));

    final overlay = Path.combine(PathOperation.difference, background, hole);

    canvas.drawPath(overlay, overlayPaint);

    // =========================
    // ESQUINAS VERDES
    // =========================

    final cornerPaint = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const cornerLength = 25.0;
    const radius = 16.0;

    // Esquina superior izquierda
    final topLeft = Path()
      ..moveTo(scanRect.left, scanRect.top + cornerLength)
      ..lineTo(scanRect.left, scanRect.top + radius)
      ..quadraticBezierTo(
        scanRect.left,
        scanRect.top,
        scanRect.left + radius,
        scanRect.top,
      )
      ..lineTo(scanRect.left + cornerLength, scanRect.top);

    canvas.drawPath(topLeft, cornerPaint);

    // Esquina superior derecha
    final topRight = Path()
      ..moveTo(scanRect.right - cornerLength, scanRect.top)
      ..lineTo(scanRect.right - radius, scanRect.top)
      ..quadraticBezierTo(
        scanRect.right,
        scanRect.top,
        scanRect.right,
        scanRect.top + radius,
      )
      ..lineTo(scanRect.right, scanRect.top + cornerLength);

    canvas.drawPath(topRight, cornerPaint);

    // Esquina inferior izquierda
    final bottomLeft = Path()
      ..moveTo(scanRect.left, scanRect.bottom - cornerLength)
      ..lineTo(scanRect.left, scanRect.bottom - radius)
      ..quadraticBezierTo(
        scanRect.left,
        scanRect.bottom,
        scanRect.left + radius,
        scanRect.bottom,
      )
      ..lineTo(scanRect.left + cornerLength, scanRect.bottom);

    canvas.drawPath(bottomLeft, cornerPaint);

    // Esquina inferior derecha
    final bottomRight = Path()
      ..moveTo(scanRect.right - cornerLength, scanRect.bottom)
      ..lineTo(scanRect.right - radius, scanRect.bottom)
      ..quadraticBezierTo(
        scanRect.right,
        scanRect.bottom,
        scanRect.right,
        scanRect.bottom - radius,
      )
      ..lineTo(scanRect.right, scanRect.bottom - cornerLength);

    canvas.drawPath(bottomRight, cornerPaint);

    // =========================
    // LÍNEA DISCONTINUA
    // =========================

    final lineY = scanRect.top + (scanRect.height * progress);

    final linePaint = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square;

    const dashWidth = 10.0;
    const dashSpace = 6.0;

    double x = scanRect.left + 8;

    while (x < scanRect.right - 8) {
      final endX = (x + dashWidth).clamp(scanRect.left + 8, scanRect.right - 8);

      canvas.drawLine(Offset(x, lineY), Offset(endX, lineY), linePaint);

      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant ScannerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
