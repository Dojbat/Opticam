import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 25),
      width: 120,
      height: 40,
      color: Colors.transparent,
      child: StrokeText(
        text: 'Favorite',
        textStyle: TextStyle(
          fontSize: 25,
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
        strokeColor: Color.fromARGB(40, 0, 0, 0),
        strokeWidth: 2,
      ),
    );
  }
}
