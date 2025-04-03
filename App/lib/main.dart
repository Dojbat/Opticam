import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urdproject/pages/start.dart';
import 'package:urdproject/pages/welcome.dart';
import 'package:urdproject/pages/login.dart';
import 'package:urdproject/pages/signup.dart';
import 'package:urdproject/pages/home.dart';
import 'package:urdproject/pages/device.dart';
import 'package:urdproject/pages/notifications.dart';
import 'package:urdproject/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomePage()
    );
  }
}