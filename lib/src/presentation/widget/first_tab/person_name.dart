import 'package:flutter/material.dart';

class PersonName extends StatelessWidget {
  final String name;

  const PersonName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
