import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study_english/ui/ui_question.dart';
import 'package:provider/provider.dart';

class ProviderSearch extends ChangeNotifier {
  List<String> danhSach = [
    'Food and drink',
    'Family',
    'Animal',
    'Color',
    'Subjects',
    'Schooltings'
  ];

  List<String> danhSachDaTimKiem = [];

  //khi vua mo app
  ProviderSearch() {
    danhSachDaTimKiem = danhSach;
  }

  //ham tim kiem
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
