import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 10, left: 255),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(245, 210, 210, 210),
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