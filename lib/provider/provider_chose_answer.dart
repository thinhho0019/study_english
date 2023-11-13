import 'package:flutter/material.dart';
import 'package:flutter_study_english/model/category.dart';
import 'package:flutter_study_english/model/question.dart';
import 'package:flutter_study_english/utils/dbhelper.dart';

class providerAnswer extends ChangeNotifier {
  int _anwserIndex = -1;
  int get getanwser => _anwserIndex;

  List<question> cate = [];
  late question qt;

  void selectIndex(int index) {
    if (_anwserIndex == -1) {
      _anwserIndex = index;
      notifyListeners();
    }
  }

  void getQuestion(int id) async {
    DbHelper dp = DbHelper();
    cate = await dp.getAllAsk(id);
    //print(cate);
    qt = cate[1];
    notifyListeners();
  }
}
