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
import 'package:http/http.dart' as http; // import the https
import 'dart:convert'; // use to encode decode json file from the SQL

void main() {
  fetchData(); // call to fetch the SQL database
  runApp(const MyApp());
}

/* This function withh fetch the data from
 * the SQL database */
Future<void> fetchData() async 
{
  try // Make a request to the SQL database
  {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/users')); // access to the HTTPS 

    if (response.statusCode == 200) // Check if it successfully fetch the data
    {
      var data = json.decode(response.body); // decode json string into dart object
      print('Fetched Data: $data');
      // You can store this data in a global variable or local storage if needed
    } 
    else // If the server fail to fetch the data
    {
      print('Failed to load users');
    }
  } 
  catch (e)
  {
    print('Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: SignUpPage()
    );
  }
}