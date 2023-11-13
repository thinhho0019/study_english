import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentBoxAsk extends StatelessWidget {
  final number;
  final title;
  ComponentBoxAsk({super.key, this.number, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question " + " :",
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
              ),
              Text(title.toString())
            ]),
      ),
    );
  }
}
