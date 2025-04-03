import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:urdproject/pages/home.dart';
import 'package:urdproject/pages/device.dart';
import 'package:urdproject/pages/notifications.dart';

class DeviceBottomNavigationBar extends StatefulWidget {
  const DeviceBottomNavigationBar({super.key});

  @override
  State<DeviceBottomNavigationBar> createState() => _DeviceBottomNavigationBarState();
}

class _DeviceBottomNavigationBarState extends State<DeviceBottomNavigationBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: GNav(
          backgroundColor: Color(0xFFFFFFFF),
          color: Color(0xFF000000),
          activeColor: Color(0xFF4A24AE),
          tabBackgroundColor: Color.fromARGB(50, 128, 90, 225),
          iconSize: 26,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.camera_alt_rounded,
              text: 'Devices',
            ),
            GButton(
              icon: Icons.notifications_none_rounded,
              text: 'Notifications',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });

            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DevicePage()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            }
          },
        ),
      ),
    );
  }
}
