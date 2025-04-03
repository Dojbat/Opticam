import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/DevicePage/Camera1.dart';
import 'package:urdproject/components/DevicePage/DeviceBottomNavigationBar.dart';
import 'package:urdproject/components/DevicePage/DeviceText1.dart';
import 'package:urdproject/components/HomePage/CameraName1.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: deviceAppBar(),
      body: Stack(
        children: [
          HomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text1(),
              Camera1(),
              CameraName1(),
            ],
          )
        ],
      ),
      bottomNavigationBar: DeviceBottomNavigationBar()
    );
  }

  AppBar deviceAppBar() {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      title: Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Center(
          child: Text(
          'Devices',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
          )
        ),
      ),
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          alignment: Alignment.center,
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent),
          child: SvgPicture.asset(
            'assets/icons/Edit.svg',
            height: 50,
            width: 50,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(13),
            alignment: Alignment.center,
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent),
            child: SvgPicture.asset(
              'assets/icons/Add.svg',
              height: 33,
              width: 33,
            ),
          ),
        )
      ],
    );
  }
}
