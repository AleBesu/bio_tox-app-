import 'dart:ui';

class Sintoma {
  final String description;
  final int _minMinutes;
  final int _maxMinutes;
  final Color color;
  const Sintoma({
    required this.description,
    required this.color,
    required int minMinutes,
    required int maxMinutes,
  }) : _minMinutes = minMinutes,
       _maxMinutes = maxMinutes;

  String get minTime {
    return _formatTime(_minMinutes);
  }

  String get maxTime {
    return _formatTime(_maxMinutes) + (_maxMinutes >= 60 ? 'H' : "MIN");
  }

  String _formatTime(int minutes) {
    if (minutes < 60) {
      return '$minutes';
    }

    final hours = minutes ~/ 60;

    return '$hours';
  }
}
