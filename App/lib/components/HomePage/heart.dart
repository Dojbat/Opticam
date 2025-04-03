import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Heart extends StatelessWidget {
  const Heart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, top: 25),
      alignment: Alignment.center,
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.transparent),
      child: SvgPicture.asset(
        'assets/icons/Heart.svg',
        height: 30,
        width: 30,
      ),
    );
  }
}
