

import 'package:flutter_study_english/model/category.dart';

class question {
  final int id;
  final String title;
  final String a;
  final String b;
  final String c;
  final String d;
  final String result;
  final dynamic image;

  question(
      {required this.id,
      required this.title,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.result,
      required this.image});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'A': a,
      'B': b,
      'C': c,
      'D': d,
      'result': result,
      'image': image
    };
  }

  factory question.fromMap(Map<dynamic, dynamic> map) {
    return question(
        id: map['id'] ?? -1,
        title: map['title'] ?? "",
        a: map['A'] ?? "",
        b: map['B'] ?? "",
        c: map['C'] ?? "",
        d: map['D'] ?? "",
        result: map['result'],
        image: map['image'] ?? null);
  }
}
