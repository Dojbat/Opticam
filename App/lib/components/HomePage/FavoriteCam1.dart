import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/pages/livecam1.dart';

class FavoriteCam1 extends StatelessWidget {
  const FavoriteCam1({super.key});

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
          margin: const EdgeInsets.only(left: 31, top: 23),
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
