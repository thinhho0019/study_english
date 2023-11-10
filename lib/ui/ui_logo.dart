import 'package:flutter/material.dart';

class mainLogo extends StatelessWidget {
  const mainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFFE5F7FF), // Màu nền #e5f7ff
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Trường TH&THCS Vĩnh Khương",
                  style: TextStyle(fontSize: 15, color: Color(0xFF09569a)),
                ),
                SizedBox(height: 50),
                Text(
                  "Study English",
                  style: TextStyle(fontSize: 40, color: Color(0xFF09569a)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
