import 'package:flutter/material.dart';

enum DangerLevel {
  bajo(Colors.green),
  medio(Colors.yellow),
  alto(Colors.red);

  final Color color;
  const DangerLevel(this.color);
}
