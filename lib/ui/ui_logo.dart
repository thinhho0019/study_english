import 'package:flutter/material.dart';

class mainLogo extends StatelessWidget {
  const mainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("Xin chào các bạn"),
        ),
      ),
    );
  }
}
