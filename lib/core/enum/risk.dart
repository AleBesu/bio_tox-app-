import 'package:flutter/material.dart';

enum Risk {
  bajo(Colors.green),
  medio(Colors.yellow),
  alto(Colors.red);

  final Color color;
  const Risk(this.color);
}
