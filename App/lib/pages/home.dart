import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(13),
                alignment: Alignment.center,
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent),
                child: SvgPicture.asset(
                  'assets/icons/Settings.svg',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2653B6),
                    Color(0xFFFFFFFF),
                  ],
                  stops: [0.3, 0.98],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 17, top: 30),
                alignment: Alignment.center,
                width: 126,
                height: 113,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'Good Morning,',
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.w500,
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
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
              ),
              Container(
                margin: const EdgeInsets.only(left: 18, right: 18, top: 11),
                width: 390,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFE8DEF8),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(35, 0, 0, 0),
                      blurRadius: 4.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150, top: 145),
                child: StrokeText(
                  text: 'No Device',
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(30, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                  strokeColor: Color.fromARGB(36, 0, 0, 0),
                  strokeWidth: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 127, top: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF4A24AE),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(40, 0, 0, 0),
                          blurRadius: 4.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Add Device',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
        bottomNavigationBar: Container(
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
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.camera_alt_outlined,
                  text: 'Devices',
                ),
                GButton(
                  icon: Icons.notifications_none_rounded,
                  text: 'Notifications',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
