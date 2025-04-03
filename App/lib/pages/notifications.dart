import 'package:flutter/material.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsBottomNavigationBar.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsText1.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: notificationsAppBar(),
      body: Stack(
        children: [
          HomeBackground(),
          Text1()
        ],
      ),
      bottomNavigationBar: NotificationsBottomNavigationBar(),
    );
  }

  AppBar notificationsAppBar() {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
        'Notifications',
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000)),
        )
      )
    );
  }
}