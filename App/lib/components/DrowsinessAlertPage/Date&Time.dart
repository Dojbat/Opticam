import 'package:flutter/material.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, top: 180),
      child: Text(
        'Date: DD/MM/YYYY\nTime: 9.00 AM',  // Link Date and Time with the Database
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Color(0xFFFFFFFF),
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color.fromARGB(30, 0, 0, 0),
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
      ),
    );
  }
}
