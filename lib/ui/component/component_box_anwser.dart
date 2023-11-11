import 'package:flutter/material.dart';

class ComponentBoxAnwser extends StatelessWidget {
  final number;
  final descript;
  const ComponentBoxAnwser({super.key, this.number, this.descript});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
        width: double.infinity,
        padding: EdgeInsets.all(7),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: number + ". ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            TextSpan(
                text: descript,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black))
          ]),
        ));
  }
}
