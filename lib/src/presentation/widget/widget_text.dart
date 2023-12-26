import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 10.0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 38.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
