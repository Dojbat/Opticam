import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urdproject/components/LoginPage/LoginLogo.dart';
import 'package:urdproject/components/SignUpPage/SignUpButton.dart';
import 'package:urdproject/components/SignUpPage/TextField1.dart';
import 'package:urdproject/components/SignUpPage/TextField2.dart';
import 'package:urdproject/components/SignUpPage/TextField3.dart';
import 'package:urdproject/components/SignUpPage/TextField4.dart';
import 'package:urdproject/components/WelcomePage/WelcomeBg.dart';
import 'package:urdproject/pages/login.dart';
import 'package:urdproject/pages/welcome.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  // Handle signup
  Future<void> signup() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) { // ensure all box is filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
      return;
    }

    if (password != confirmPassword) { // check if the password match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/signup'), // Access the signup endpoint in server.js
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        print('Signup successful: $data');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );

        // Navigate to the login page after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInPage()),
        );
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
      print('Error: $e');
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
      appBar: signupAppBar(context),
      body: Stack(
        children: [
          WelcomeBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginLogo(),
              TextField1(controller: _usernameController),
              TextField2(controller: _emailController),
              TextField3(controller: _passwordController),
              TextField4(controller: _confirmPasswordController),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SignUpButton(onTap: signup), // Connect the signup button
            ],
          )
        ],
      ),
    );
  }

  AppBar signupAppBar(BuildContext context) {
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
