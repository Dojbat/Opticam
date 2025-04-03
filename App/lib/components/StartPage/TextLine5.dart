import 'package:flutter/material.dart';

class TextLine5 extends StatelessWidget {
  const TextLine5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55),
      child: Text(
        'the sight is secure for you',
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
