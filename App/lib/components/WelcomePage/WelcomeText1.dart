import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Text(
        'Welcome to',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w500,
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
