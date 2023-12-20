import 'dart:async';

class MapTimer {
  MapTimer(Function(Timer) function) {
    Timer.periodic(
      const Duration(
        seconds: 30,
      ),
      function,
    );
  }

  static MapTimer? _instance;

  static MapTimer getInstance(Function(Timer) function) {
    _instance ??= MapTimer(function);
    return _instance!;
  }
}
