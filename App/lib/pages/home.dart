import 'package:flutter/material.dart';
import 'package:urdproject/components/HomePage/AddDeviceButton.dart';
import 'package:urdproject/components/HomePage/CameraName1.dart';
import 'package:urdproject/components/HomePage/FavoriteCam1.dart';
import 'package:urdproject/components/HomePage/HomeBottomNavigationBar.dart';
import 'package:urdproject/components/HomePage/HomeFav.dart';
import 'package:urdproject/components/HomePage/HomeLine.dart';
import 'package:urdproject/components/HomePage/HomeLogo.dart';
import 'package:urdproject/components/HomePage/HomeText1.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/HomePage/HomeText2.dart';
import 'package:urdproject/components/HomePage/HomeText3.dart';
import 'package:urdproject/components/HomePage/SettingsButton.dart';
import 'package:urdproject/components/HomePage/heart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          HomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Logo(),
                  SettingsButton(),
                ],
              ),
              Text1(),
              Text2(),
              Line(),
              //Text3(),
              //AddDeviceButton(),
              Row(
                children: [
                  Heart(),
                  Favorite(),
                ],
              ),
              FavoriteCam1(),
              CameraName1(),
            ],
          ),
        ]),
        bottomNavigationBar: HomeBottomNavigationBar()
    );
  }
}
