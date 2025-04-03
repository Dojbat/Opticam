import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FacebookIcon extends StatelessWidget {
  const FacebookIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37, top: 600),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 101,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 255, 255, 255),
            border: Border.all(
              color: Color.fromARGB(11, 0, 0, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(28, 0, 0, 0),
                blurRadius: 4.0,
                offset: Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/Facebook.svg',
              width: 28,
              height: 28,
            ),
          ),
        ),
      ),
    );
  }
}
