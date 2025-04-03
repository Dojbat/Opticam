import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  const Text2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Text(
        'OPTICAM!',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: Color(0xFFFFFFFF),
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color.fromARGB(30, 0, 0, 0),
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
      ),
    );
  }
}
