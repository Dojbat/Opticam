import 'package:flutter/material.dart';
import 'package:urdproject/components/WelcomePage/FacebookIcon.dart';
import 'package:urdproject/components/WelcomePage/GoogleIcon.dart';
import 'package:urdproject/components/WelcomePage/LineIcon.dart';
import 'package:urdproject/components/WelcomePage/LoginButton.dart';
import 'package:urdproject/components/WelcomePage/SignUpButton.dart';
import 'package:urdproject/components/WelcomePage/WelcomeBg.dart';
import 'package:urdproject/components/WelcomePage/WelcomeLine.dart';
import 'package:urdproject/components/WelcomePage/WelcomeLogo.dart';
import 'package:urdproject/components/WelcomePage/WelcomeText1.dart';
import 'package:urdproject/components/WelcomePage/WelcomeText2.dart';
import 'package:urdproject/components/WelcomePage/WelcomeText3.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WelcomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Logo(),
              Text1(),
              Text2(),
              Text3(),
              LoginButton(),
              SignupButton(),
              Line(),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FacebookIcon(),
              GoogleIcon(),
              LineIcon(),
            ],
          )
        ],
      ),
    );
  }
}
