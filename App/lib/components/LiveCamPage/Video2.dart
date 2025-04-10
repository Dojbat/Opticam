import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:urdproject/components/LiveCamPage/LiveIcon.dart';

class Video2 extends StatefulWidget {
  const Video2({super.key});

  @override
  State<Video2> createState() => _Video2State();
}

class _Video2State extends State<Video2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/BackVideo.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31, top: 60),
      child: Stack(
        children: [
          Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(15, 0, 0, 0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(50, 0, 0, 0),
                  blurRadius: 4.0,
                  offset: Offset(0.0, 4.0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : Center(
                      child:
                          CircularProgressIndicator(),
                    ),
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: LiveIcon(),
          ),
        ],
      ),
    );
  }
}
