import 'package:flutter/material.dart';

class TextLine1 extends StatelessWidget {
  const TextLine1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 512, left: 49),
      child: Text(
        'Secure Yourself',
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
