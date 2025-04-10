import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/pages/livecam1.dart';

class Camera1 extends StatelessWidget {
  const Camera1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LiveCamPage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 31, top: 158),
          alignment: Alignment.center,
          width: 163,
          height: 163,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.transparent),
          // child: SvgPicture.asset(
          //   'assets/icons/Cam.svg',
          //   height: 150,
          //   width: 150,
          // ),
          child: Image.asset(
            'assets/images/Cam.png',
            height: 155,
            width: 155,
          ),
        ),
      );
  }
}