import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Startbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 512, left: 49),
                child: Text(
                  'Secure Yourself',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 52),
                child: Text(
                  'and Your Car with',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Text(
                  'OPTICAM!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 55),
                child: Text(
                  'Welcome to our safezone, where all',
                  style: TextStyle(
                    color: const Color.fromARGB(245, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text(
                  'the sight is secure for you',
                  style: TextStyle(
                    color: const Color.fromARGB(245, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.3,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 52, top: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 312,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF8667D8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(40, 0, 0, 0),
                          blurRadius: 4.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
