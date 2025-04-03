import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 17, top: 30),
      alignment: Alignment.center,
      width: 153,
      height: 143,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent),
    );
  }
}
