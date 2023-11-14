import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_timenext.dart';
import 'package:provider/provider.dart';

class mainLogo extends StatelessWidget {
  const mainLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<providerTimeNext>(
      builder: (context, value, child) {
        value.startTimer(context);
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/img_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // color: Color(0xFFE5F7FF), // Màu nền #e5f7ff
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Trường TH&THCS Vĩnh Khương",
                    style: TextStyle(fontSize: 15, color: Color(0xFF09569a)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Study English",
                    style: TextStyle(fontSize: 40, color: Color(0xFF09569a)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
