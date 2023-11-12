import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_chose_answer.dart';
import 'package:flutter_study_english/ui/component/component_box_anwser.dart';
import 'package:flutter_study_english/ui/component/component_box_ask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class uiQuestion extends StatelessWidget {
  uiQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final list_anwser = ['narutor', 'picked', 'micen', 'sencen'];
    final provider_anwser = Provider.of<providerAnswer>(context);
    final result = 2;
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 247, 255, 1),
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
                        "cat",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(right: 10),
                  //     padding: EdgeInsets.all(6),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.black),
                  //         borderRadius: BorderRadius.all(Radius.circular(4))),
                  //     child: RichText(
                  //       text: TextSpan(children: [
                  //         TextSpan(
                  //             text: "Đ: ", style: TextStyle(color: Colors.red)),
                  //         TextSpan(
                  //             text: "12", style: TextStyle(color: Colors.red)),
                  //         TextSpan(
                  //             text: " - ",
                  //             style: TextStyle(color: Colors.black)),
                  //         TextSpan(
                  //             text: "S: ",
                  //             style: TextStyle(color: Colors.green)),
                  //         TextSpan(
                  //             text: "00",
                  //             style: TextStyle(color: Colors.green)),
                  //       ]),
                  //     )),
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list_anwser.length,
                  itemBuilder: (context, index) {
                    return ComponentBoxAnwser(
                      number: index == 0
                          ? 'A'
                          : index == 1
                              ? 'B'
                              : index == 2
                                  ? 'C'
                                  : 'D',
                      descript: list_anwser[index],
                      index: index,
                      result: result,
                      provider_anwser: provider_anwser,
                    );
                  },
                )
                // ComponentBoxAnwser(
                // number: "A", descript: "cái này là gì tại sao vậy."),
                // ComponentBoxAnwser(
                //     number: "B", descript: "cái này là gì tại sao vậy."),
                // ComponentBoxAnwser(
                //     number: "C", descript: "cái này là gì tại sao vậy."),
                // ComponentBoxAnwser(
                //     number: "D", descript: "cái này là gì tại sao vậy.")
                ,
              ),
            ),
            Expanded(
                child: provider_anwser.getanwser != -1
                    ? Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(6),
                        child: Text(
                            "câu A sai bởi vì câu A đang trong tình thế ngàn cân theo sợi bún riêu cua"),
                      )
                    : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
