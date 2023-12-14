import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Second Tab',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
