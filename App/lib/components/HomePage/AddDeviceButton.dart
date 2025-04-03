import 'package:flutter/material.dart';

class AddDeviceButton extends StatelessWidget {
  const AddDeviceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 127, top: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 160,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF4A24AE),
                    borderRadius: BorderRadius.circular(10),
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
                      'Add Device',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            );
  }
}