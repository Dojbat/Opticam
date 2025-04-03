import 'package:flutter/material.dart';
import 'package:urdproject/components/StartPage/GetStartedButton.dart';
import 'package:urdproject/components/StartPage/TextLine1.dart';
import 'package:urdproject/components/StartPage/TextLine2.dart';
import 'package:urdproject/components/StartPage/TextLine3.dart';
import 'package:urdproject/components/StartPage/TextLine4.dart';
import 'package:urdproject/components/StartPage/TextLine5.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Startbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextLine1(),
              TextLine2(),
              TextLine3(),
              TextLine4(),
              TextLine5(),
              GetStartedButton(),
            ],
          )
        ],
      ),
    );
  }
}
