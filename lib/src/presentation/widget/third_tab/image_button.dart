import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(
          key: key,
        );

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
