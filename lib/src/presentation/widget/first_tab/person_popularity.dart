import 'package:flutter/material.dart';

class PersonPopularity extends StatelessWidget {
  final num popularity;

  const PersonPopularity({
    super.key,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        children: [
          Text(
            'Popularity: $popularity',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
