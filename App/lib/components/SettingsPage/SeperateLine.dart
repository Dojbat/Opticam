import 'package:flutter/material.dart';

class SeperateLine extends StatelessWidget {
  const SeperateLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, top: 9),
      width: 390,
      height: 4,
      decoration: BoxDecoration(
        color: Color.fromARGB(39, 129, 129, 129),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
