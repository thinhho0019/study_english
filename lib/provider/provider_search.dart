import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study_english/ui/ui_question.dart';
import 'package:provider/provider.dart';

class ProviderSearch extends ChangeNotifier {
  List<String> danhSach = [
    'Item 0',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  List<String> danhSachDaTimKiem = [];

  void search(String keyword) {
    if (keyword.isEmpty) {
      danhSachDaTimKiem = danhSach;
    } else {
      danhSachDaTimKiem = danhSach
          .where((item) => item.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
