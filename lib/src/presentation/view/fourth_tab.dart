import 'package:flutter/material.dart';

class FourthTab extends StatefulWidget {
  const FourthTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Fourth Tab',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
