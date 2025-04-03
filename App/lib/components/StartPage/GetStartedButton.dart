import 'package:flutter/material.dart';
import 'package:urdproject/pages/welcome.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 52, top: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomePage()),
          );
        },
        child: Container(
          width: 312,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF8667D8),
            borderRadius: BorderRadius.circular(20),
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
              'Get Started',
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
