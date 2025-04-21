import 'package:flutter/material.dart';
import 'package:urdproject/pages/fakenoti.dart';

class HiddenButton extends StatelessWidget {
  const HiddenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FakenotiPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 780, left: 330),
        width: 80,
        height: 60,
        color: Colors.transparent,
      ),
    );
  }
}