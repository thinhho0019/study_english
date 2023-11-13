import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_chose_answer.dart';
import 'package:flutter_study_english/ui/component/component_box_anwser.dart';
import 'package:flutter_study_english/ui/component/component_box_ask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class uiQuestion extends StatelessWidget {
  final int id_cate;
  uiQuestion({super.key, required this.id_cate});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerAnswer(),
      child: childUIQuestion(id_cate: id_cate),
    );
  }
}

class childUIQuestion extends StatelessWidget {
  final int id_cate;
  childUIQuestion({super.key, required this.id_cate});

  @override
  Widget build(BuildContext context) {
    final provider_anwser = Provider.of<providerAnswer>(context, listen: false);
    provider_anwser.getQuestion(id_cate);

    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 247, 255, 1),
      body: SafeArea(
        child: Consumer<providerAnswer>(
          builder: (context, provider, _) {
            if (provider.qt.id == -1) {
              return Center(child: CircularProgressIndicator());
            }
            final list_anwser = [
              provider_anwser.qt.a,
              provider_anwser.qt.b,
              provider_anwser.qt.c,
              provider_anwser.qt.d
            ];
            final result = int.tryParse(provider_anwser.qt.result);
            return Column(
              children: [
                Container(
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset('assets/icon/Back.svg')),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider_anwser.nextQuestion(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "Next",
                            style: GoogleFonts.aBeeZee(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ComponentBoxAsk(
                  number: 1,
                  title: context.watch<providerAnswer>().qt.title,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list_anwser.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white, // Màu nền của container
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Màu của BoxShadow
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0,
                                    3), // Độ đổ bóng theo chiều ngang và chiều dọc
                              ),
                            ],
                          ),
                          child: ComponentBoxAnwser(
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
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Expanded(
                //     child: provider_anwser.getanwser != -1
                //         ? Container(
                //             margin: EdgeInsets.only(right: 10),
                //             padding: EdgeInsets.all(6),
                //             child: Text(
                //                 "câu A sai bởi vì câu A đang trong tình thế ngàn cân theo sợi bún riêu cua"),
                //           )
                //         : SizedBox.shrink())
              ],
            );
          },
        ),
      ),
    );
  }
}
