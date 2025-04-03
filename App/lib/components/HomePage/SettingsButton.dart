import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/pages/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 180),
        alignment: Alignment.center,
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.transparent),
        child: SvgPicture.asset(
          'assets/icons/Settings.svg',
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
