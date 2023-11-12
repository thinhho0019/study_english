import 'package:flutter/material.dart';

class providerAnswer extends ChangeNotifier {
  int _anwserIndex = -1;
  int get getanwser => _anwserIndex;

  void selectIndex(int index) {
    if (_anwserIndex == -1) {
      _anwserIndex = index;
      notifyListeners();
    }
  }
}
