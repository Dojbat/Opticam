import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 88, top: 66),
      alignment: Alignment.center,
      width: 237,
      height: 191,
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
