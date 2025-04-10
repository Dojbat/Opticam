import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/LoginPage/LoginLogo.dart';
import 'package:urdproject/components/LoginPage/TextField1.dart';
import 'package:urdproject/components/LoginPage/TextField2.dart';
import 'package:urdproject/components/LoginPage/LoginText1.dart';
import 'package:urdproject/components/LoginPage/Checkbox.dart';
import 'package:urdproject/components/LoginPage/LoginText2.dart';
import 'package:urdproject/components/LoginPage/LoginButton.dart';
import 'package:urdproject/components/WelcomePage/WelcomeBg.dart';
import 'package:urdproject/pages/home.dart';
import 'package:urdproject/pages/welcome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool? isChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;


  Future<void> login() async { 
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) // Check if the username and password are empty
    { 
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
      return;
    }

    setState(()
    {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'), // access the login from server.js
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}), // encode the username and password into json
      );

      if (response.statusCode == 200) { // Check if the response is successful
        final data = json.decode(response.body);
        print('Fetched Login Data: $data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); // Navigate to the home page on successful login
      } else {
        final data = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: loginAppBar(context),
      body: Stack(
        children: [
          WelcomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginLogo(),
              TextField1(controller: _usernameController),
              TextField2(controller: _passwordController),
              Text1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  Text2(),
                ],
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LoginButton(
                        onTap: login,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar loginAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
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
            'assets/icons/ArrowLeft.svg',
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
