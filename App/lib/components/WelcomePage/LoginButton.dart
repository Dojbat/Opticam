import 'package:flutter/material.dart';
import 'package:urdproject/pages/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 43, top: 55),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInPage()),
          );
        },
        child: Container(
          width: 327,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF4A24AE),
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
              'Log in',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
