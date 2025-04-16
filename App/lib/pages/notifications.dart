import 'package:flutter/material.dart';
import 'package:urdproject/components/HomePage/HomeBg.dart';
import 'package:urdproject/components/NotificationsPage/Date.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsBottomNavigationBar.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsList.dart';
import 'package:urdproject/components/NotificationsPage/NotificationsText1.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
            notifications = data['videos'];
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
      appBar: notificationsAppBar(),
      body: Stack(
        children: [
          HomeBackground(),
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

  AppBar notificationsAppBar() {
    return AppBar(
      toolbarHeight: 90,
      backgroundColor: Color(0xFFFFFFFF),
      shadowColor: Colors.black54,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
        'Notifications',
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000)),
        )
      )
    );
  }
}