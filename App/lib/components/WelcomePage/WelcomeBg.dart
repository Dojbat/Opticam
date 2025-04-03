import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2653B6),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.3, 0.98],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/wbg.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              )),
        );
  }
}