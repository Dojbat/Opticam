import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 136),
      child: StrokeText(
        text: 'Today',  // Link Date with the Database
        textStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF),
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color.fromARGB(30, 0, 0, 0),
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
        strokeColor: Color.fromARGB(36, 0, 0, 0),
        strokeWidth: 2,
      ),
    );
  }
}
