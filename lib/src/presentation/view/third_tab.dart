import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Third Tab',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
