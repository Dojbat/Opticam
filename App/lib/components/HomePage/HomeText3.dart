import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 150, top: 145),
              child: StrokeText(
                text: 'No Device',
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