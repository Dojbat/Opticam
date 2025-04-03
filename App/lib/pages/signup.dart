import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/LoginPage/LoginLogo.dart';
import 'package:urdproject/components/SignUpPage/SignUpButton.dart';
import 'package:urdproject/components/SignUpPage/TextField1.dart';
import 'package:urdproject/components/SignUpPage/TextField2.dart';
import 'package:urdproject/components/SignUpPage/TextField3.dart';
import 'package:urdproject/components/SignUpPage/TextField4.dart';
import 'package:urdproject/components/WelcomePage/WelcomeBg.dart';
import 'package:urdproject/pages/welcome.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: signupAppBar(context),
      body: Stack(
        children: [
          WelcomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginLogo(),
              TextField1(),
              TextField2(),
              TextField3(),
              TextField4(),
              SignUpButton(),
            ],
          )
        ],
      ),
    );
  }

  AppBar signupAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
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
            'assets/icons/ArrowLeft.svg',
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
