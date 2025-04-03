import 'package:flutter/material.dart';

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Text(
        'Easiest way to protect your car',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Color(0xFFEFEFEF),
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
