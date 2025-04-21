import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class NotificationsList extends StatelessWidget {
  final List<dynamic> notifications;

  const NotificationsList({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        final videoData = notification['video_data'];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Event: ${notification['event_type']}'),
                subtitle: Text('Time: ${notification['start_time']} - ${notification['end_time']}'),
              ),
              if (videoData != null)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayerWidget(base64Video: videoData),
                ),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String base64Video;

  const VideoPlayerWidget({Key? key, required this.base64Video}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      // Decode the Base64 video data
      final videoBytes = base64Decode(widget.base64Video);
      print('Video data length: ${widget.base64Video.length}');

      // Get the temporary directory
      final tempDir = await getTemporaryDirectory();

      // Create a unique temporary file for the video
      final tempFile = File('${tempDir.path}/temp_video_${DateTime.now().millisecondsSinceEpoch}.mp4');
      await tempFile.writeAsBytes(videoBytes);
      print('Temporary video file created at: ${tempFile.path}');

      // Initialize the video player with the temporary file
      _controller = VideoPlayerController.file(tempFile);
      _initializeVideoPlayerFuture = _controller.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  @override
  void dispose() {
    _controller.pause(); // Pause the video before disposing
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause(); // Pause video on tap
              } else {
                _controller.play(); // Play video on tap
              }
              setState(() {}); // Update UI to reflect play/pause state
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                if (!_controller.value.isPlaying)
                  Container(
                    color: Colors.black26,
                    child: Icon(Icons.play_arrow, color: Colors.white, size: 50),
                  ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading video: ${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}