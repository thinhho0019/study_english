import 'package:flutter_study_english/model/category.dart';

class question {
  final int id;
  final String title;
  final String a;
  final String b;
  final String c;
  final String d;
  final String result;

  question(
      {required this.id,
      required this.title,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.result});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'result': result
    };
  }

  factory question.fromMap(Map<dynamic, dynamic> map) {
    return question(
        id: map['id'],
        title: map['title'],
        a: map['a'],
        b: map['b'],
        c: map['c'],
        d: map['d'],
        result: map['result']);
  }
}
