import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(left: 18, right: 18, top: 11),
              width: 390,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xFFE8DEF8),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(35, 0, 0, 0),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 4.0),
                  ),
                ],
              ),
            );
  }
}