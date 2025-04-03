import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListLanguage extends StatelessWidget {
  const ListLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Language',
          style: TextStyle(
            fontSize: 18,
          )),
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {},
      leading: SvgPicture.asset(
        'assets/icons/Language.svg',
        height: 35,
        width: 35,
      ),
      trailing: SvgPicture.asset(
        'assets/icons/Chevron Right.svg',
        height: 29,
        width: 29,
      ),
    );
  }
}
