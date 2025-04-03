import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/SettingsPage/ListAbout.dart';
import 'package:urdproject/components/SettingsPage/ListAccount.dart';
import 'package:urdproject/components/SettingsPage/ListLanguage.dart';
import 'package:urdproject/components/SettingsPage/ListLogout.dart';
import 'package:urdproject/components/SettingsPage/ListNotifications.dart';
import 'package:urdproject/components/SettingsPage/ListSecurity.dart';
import 'package:urdproject/components/SettingsPage/ListSupport.dart';
import 'package:urdproject/components/SettingsPage/ListThemes.dart';
import 'package:urdproject/components/SettingsPage/SeperateLine.dart';
import 'package:urdproject/pages/home.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: settingsAppBar(context),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
            ),
          ),
          ListView(
            padding: const EdgeInsets.only(top: 145, left: 7),
            children: [
              ListAccount(),
              SeperateLine(),
              SizedBox(height: 10),
              ListSecurity(),
              SeperateLine(),
              SizedBox(height: 10),
              ListNotifications(),
              SeperateLine(),
              SizedBox(height: 10),
              ListLanguage(),
              SeperateLine(),
              SizedBox(height: 10),
              ListThemes(),
              SeperateLine(),
              SizedBox(height: 10),
              ListSupport(),
              SeperateLine(),
              SizedBox(height: 10),
              ListAbout(),
              SeperateLine(),
              SizedBox(height: 10),
              ListLogout(),
            ],
          ),
        ],
      ),
    );
  }

  AppBar settingsAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(right: 45),
        child: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
          ),
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
