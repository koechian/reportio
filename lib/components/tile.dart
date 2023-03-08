import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String imagePath;

  const Tile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.3,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.black),
      child: Image.asset(
        imagePath,
        height: 42,
      ),
    );
  }
}
