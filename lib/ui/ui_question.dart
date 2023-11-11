import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study_english/ui/component/component_box_anwser.dart';
import 'package:flutter_study_english/ui/component/component_box_ask.dart';
import 'package:flutter_svg/flutter_svg.dart';

class uiQuestion extends StatelessWidget {
  const uiQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset('assets/icon/Back.svg')),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "con mèo",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Đ: ", style: TextStyle(color: Colors.red)),
                          TextSpan(
                              text: "12", style: TextStyle(color: Colors.red)),
                          TextSpan(
                              text: " - ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "S: ",
                              style: TextStyle(color: Colors.green)),
                          TextSpan(
                              text: "00",
                              style: TextStyle(color: Colors.green)),
                        ]),
                      )),
                ],
              ),
            ),
            ComponentBoxAsk(
              number: 1,
              title:
                  "I’m afraid very few people know about the concert and almost no one will come. If only the posters _____________ on time.",
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  ComponentBoxAnwser(
                      number: "Question A",
                      descript: "cái này là gì tại sao vậy."),
                  ComponentBoxAnwser(
                      number: "Question B",
                      descript: "cái này là gì tại sao vậy."),
                  ComponentBoxAnwser(
                      number: "Question C",
                      descript: "cái này là gì tại sao vậy."),
                  ComponentBoxAnwser(
                      number: "Question D",
                      descript: "cái này là gì tại sao vậy.")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
