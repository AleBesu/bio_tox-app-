import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  final Future<void> Function() functionToLoad;
  final VoidCallback? onComplete;
  const LoadingScreen({
    super.key,
    required this.functionToLoad,
    this.onComplete,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: widget.functionToLoad(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.onComplete?.call();
              });
              return const SizedBox.shrink();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
