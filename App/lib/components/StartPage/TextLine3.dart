import 'package:flutter/material.dart';

class TextLine3 extends StatelessWidget {
  const TextLine3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48),
      child: Text(
        'OPTICAM!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
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
