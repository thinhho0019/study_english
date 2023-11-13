import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentBoxAsk extends StatelessWidget {
  final number;
  final title;
  final image;
  ComponentBoxAsk({super.key, this.number, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    var img;
    if (image != null) {
      // Only decode if blob is not null to prevent crashes
      
      img = Uint8List.fromList(image);
    }
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
              Text(title.toString()),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.center,
                  child: img != null
                      ? Image.memory(
                          img,
                          height: 200,
                          width: 200,
                        )
                      : SizedBox.shrink()),
            ]),
      ),
    );
  }
}
