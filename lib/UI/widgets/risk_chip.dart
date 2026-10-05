import 'package:bio_tox/core/enum/risk.dart';
import 'package:flutter/material.dart';

class RiskChip extends StatelessWidget {
  const RiskChip({super.key, required this.risk});
  final Risk risk;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('RIESGO ${risk.name.toUpperCase()}'),
      labelStyle: TextStyle(
        color: risk.color,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: .8,
      ),
      backgroundColor: risk.color.withOpacity(.1),
      side: BorderSide(color: risk.color.withOpacity(.25)),
      shape: const StadiumBorder(),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
