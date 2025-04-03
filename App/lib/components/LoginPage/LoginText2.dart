import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  const Text2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(top: 33, left: 11),
                    child: Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFEFEFEF),
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