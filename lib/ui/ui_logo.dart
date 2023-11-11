import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_timenext.dart';
import 'package:provider/provider.dart';

class mainLogo extends StatelessWidget {
  const mainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("day la logo"),
        ),
      ),
    );
  }
}
