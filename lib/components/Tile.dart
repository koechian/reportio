import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String imagePath;

  const Tile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200),
      child: Image.asset(
        imagePath,
        height: 42,
      ),
    );
  }
}
