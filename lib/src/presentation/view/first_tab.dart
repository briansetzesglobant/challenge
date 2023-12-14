import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'First Tab',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
