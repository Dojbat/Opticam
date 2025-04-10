import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/DevicePage/DeviceBottomNavigationBar.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/LiveCamPage/Video1.dart';
import 'package:urdproject/components/LiveCamPage/Video2.dart';
import 'package:urdproject/pages/device.dart';

class LiveCamPage extends StatelessWidget {
  const LiveCamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: liveCamAppBar(context),
      body: Stack(
        children: [
          HomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Video1(),
              Video2(),
            ],
          )
        ],
      ),
      bottomNavigationBar: DeviceBottomNavigationBar()
    );
  }

  AppBar liveCamAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      title: Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Center(
          child: Text(
          'Cam 1',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
          )
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DevicePage()),
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
            'assets/icons/ArrowLeftBlack.svg',
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
              'assets/icons/Heart.svg',
              height: 33,
              width: 33,
            ),
          ),
        )
      ],
    );
  }
}
