import 'package:flutter/material.dart';

class TextLine4 extends StatelessWidget {
  const TextLine4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 55),
      child: Text(
        'Welcome to our safezone, where all',
        style: TextStyle(
          color: const Color.fromARGB(245, 255, 255, 255),
          fontSize: 14,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.3,
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color.fromARGB(35, 0, 0, 0),
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
      ),
    );
  }
}
