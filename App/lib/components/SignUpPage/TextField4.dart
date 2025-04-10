import 'package:flutter/material.dart';

class TextField4 extends StatelessWidget {
  final TextEditingController controller;
  const TextField4({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 40, right: 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(13, 0, 0, 0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(200, 229, 229, 229),
          contentPadding: EdgeInsets.all(25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          hintText: 'Confirm Password*',
          hintStyle: TextStyle(
            color: Color(0xFF818181),
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
