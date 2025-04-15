import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/DrowsinessAlertPage/Date&Time.dart';
import 'package:urdproject/components/DrowsinessAlertPage/Topic.dart';
import 'package:urdproject/components/DrowsinessAlertPage/Video.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsBottomNavigationBar.dart';
import 'package:urdproject/pages/notifications.dart';

class DrowsinessAlertPage extends StatelessWidget {
  const DrowsinessAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: notificationsAppBar(context),
      body: Stack(
        children: [
          HomeBackground(),
          Topic(),
          DateAndTime(),
          Video(),
        ],
      ),
      bottomNavigationBar: NotificationsBottomNavigationBar(),
    );
  }

  AppBar notificationsAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(right: 54),
        child: Center(
          child: Text(
          'Notifications',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
          )
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NotificationsPage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent),
          child: SvgPicture.asset(
            'assets/icons/ArrowLeftBlack.svg',
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}