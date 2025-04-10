import 'package:flutter/material.dart';
import 'package:urdproject/pages/login.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onTap;
  const SignUpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 43, top: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 327,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            border: Border.all(
              color: Color(0xFF4A24AE),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(40, 0, 0, 0),
                blurRadius: 4.0,
                offset: Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4A24AE),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
