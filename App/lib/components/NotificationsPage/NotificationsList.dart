import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/pages/drowsinessAlert.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, top: 192),
      child: Stack(
        children: [
          Container(
            width: 370,
            height: 75,
            decoration: BoxDecoration(
              color: Color.fromARGB(97, 26, 26, 26),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(50, 0, 0, 0),
                  blurRadius: 4.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                title: Text('Drowsiness Alert',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFFFFF),
                  )
                ),
                subtitle: Text('9.00 AM', // Link the time with Database
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(217, 255, 255, 255),
                    fontWeight: FontWeight.w400
                  )
                ),
                tileColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DrowsinessAlertPage()),
                  );
                },
                leading: SvgPicture.asset(
                  'assets/icons/Sleep.svg',
                  height: 35,
                  width: 35,
                ),
                trailing: SvgPicture.asset(
                  'assets/icons/Chevron Right White.svg',
                  height: 29,
                  width: 29,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}