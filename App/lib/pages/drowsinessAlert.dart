import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/NotificationsPage/Date.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsBottomNavigationBar.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsText1.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:urdproject/pages/fakenoti.dart';
import 'package:urdproject/components/DrowsinessAlertPage/Video.dart';

class DrowsinessAlertPage extends StatefulWidget {
  const DrowsinessAlertPage({super.key});

  @override
  State<DrowsinessAlertPage> createState() => _DrowsinessAlertPageState();
}

class _DrowsinessAlertPageState extends State<DrowsinessAlertPage> {
  List<dynamic> notifications = [];
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchNotifications(); // Fetch notifications every time the page is navigated to
  }

  Future<void> fetchNotifications() async {
    const userId = 1; // Replace with dynamic user ID if needed
    final url = Uri.parse('http://10.0.2.2:3000/notification/$userId'); // Use your machine's IP address

    try {
      setState(() {
        isLoading = true; // Show loading indicator while fetching
      });

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          setState(() {
            notifications = data['videos']; // Ensure 'videos' contains 'video_data'
            isLoading = false;
          });
        } else {
          setState(() {
            notifications = [];
            isLoading = false;
          });
        }
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: notificationsAppBar(context),
      body: Stack(
        children: [
          HomeBackground(),
          SizedBox(height: 30),
          if (isLoading)
            Center(child: CircularProgressIndicator())
          else if (notifications.isEmpty)
            Center(child: Text('No notifications available'))
          else
            NotificationsList(notifications: notifications),
        ],
      ),
      bottomNavigationBar: NotificationsBottomNavigationBar(),
    );
  }

  AppBar notificationsAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(right: 54),
        child: Center(
          child: Text(
          'Notifications',
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
            MaterialPageRoute(builder: (context) => FakenotiPage()),
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
    );
  }
}

class NotificationsList extends StatelessWidget {
  final List<dynamic> notifications;

  const NotificationsList({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        final videoData = notification['video_data']; // Ensure this field exists in the API response

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