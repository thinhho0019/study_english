import 'package:flutter/material.dart';

class ComponentBoxAnwser extends StatelessWidget {
  final number;
  final descript;
  const ComponentBoxAnwser({super.key, this.number, this.descript});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(7),
        width: double.infinity,
        padding: EdgeInsets.all(7),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: number + ": ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: descript)
          ]),
        ));
  }
}
