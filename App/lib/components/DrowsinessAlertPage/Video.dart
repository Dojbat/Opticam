import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31, top: 255),
      child: Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(15, 0, 0, 0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(50, 0, 0, 0),
                  blurRadius: 4.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),

          // Get Video from Database
      )
    );
  }
}
