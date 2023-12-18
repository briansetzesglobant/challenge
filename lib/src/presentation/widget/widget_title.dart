import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  final String title;

  const WidgetTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
