import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListLogout extends StatelessWidget {
  const ListLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Log out',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFF0000),
          )),
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {},
      leading: SvgPicture.asset(
        'assets/icons/Logout.svg',
        height: 35,
        width: 35,
      ),
    );
  }
}
