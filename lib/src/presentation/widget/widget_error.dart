import 'package:challenge/src/presentation/widget/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 100.0,
            ),
            WidgetText(
              text: error,
            ),
          ],
        ),
      ),
    );
  }
}
