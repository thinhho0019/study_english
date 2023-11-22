import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_chose_answer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentBoxAnwser extends StatelessWidget {
  final number;
  final descript;
  final index;
  final result;
  final provider_anwser;

  const ComponentBoxAnwser(
      {super.key,
      this.number,
      this.descript,
      this.index,
      this.result,
      this.provider_anwser});

  @override
  Widget build(BuildContext context) {
    print("index:" + index.toString() + "result:" + result.toString());
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        provider_anwser.selectIndex(index);
        //nếu chọn sai
        if (index == provider_anwser.getanwser &&
            result != provider_anwser.getanwser) {
          provider_anwser.showMessageAgain(context);
        }
      },
      child: Container(
          decoration: BoxDecoration(
              color: index == result && result == provider_anwser.getanwser
                  ? Colors.green
                  : index == provider_anwser.getanwser &&
                          result != provider_anwser.getanwser
                      ? Colors.red
                      : Colors.white,
              borderRadius: BorderRadius.circular(5)),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
          width: double.infinity,
          padding: EdgeInsets.all(7),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: number + ". ",
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(
                  text: descript,
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.normal, color: Colors.black))
            ]),
          )),
    );
  }
}
