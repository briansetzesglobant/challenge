import 'package:challenge/src/presentation/widget/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetEmpty extends StatelessWidget {
  const WidgetEmpty({
    super.key,
    required this.icon,
    required this.message,
  });

  final IconData icon;
  final String message;

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
            Icon(
              icon,
              size: 100.0,
            ),
            WidgetText(
              text: message,
            ),
          ],
        ),
      ),
    );
  }
}
