import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/LoginPage/LoginLogo.dart';
import 'package:urdproject/components/LoginPage/TextField1.dart';
import 'package:urdproject/components/LoginPage/TextField2.dart';
import 'package:urdproject/components/LoginPage/LoginText1.dart';
import 'package:urdproject/components/LoginPage/Checkbox.dart';
import 'package:urdproject/components/LoginPage/LoginText2.dart';
import 'package:urdproject/components/LoginPage/LoginButton.dart';
import 'package:urdproject/components/WelcomePage/WelcomeBg.dart';
import 'package:urdproject/pages/welcome.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: loginAppBar(context),
      body: Stack(
        children: [
          WelcomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginLogo(),
              TextField1(),
              TextField2(),
              Text1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  Text2(),
                ],
              ),
              LoginButton()
            ],
          ),
        ],
      ),
    );
  }

  AppBar loginAppBar(BuildContext context) {
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
