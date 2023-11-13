import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study_english/model/category.dart';
import 'package:flutter_study_english/ui/ui_question.dart';
import 'package:flutter_study_english/utils/dbhelper.dart';
import 'package:provider/provider.dart';

class ProviderSearch extends ChangeNotifier {
  List<category> danhSach = [
    // 'Food and drink',
    // 'Family',
    // 'Animal',
    // 'Color',
    // 'Subjects',
    // 'Schooltings'
  ];

  List<category> danhSachDaTimKiem = [];

  //khi vua mo app
  ProviderSearch() {
    loadList();
  }
  void loadList() async {
    DbHelper dp = DbHelper();
    List<category> cate = await dp.getAllCategory();
    danhSach = cate;
    danhSachDaTimKiem = danhSach;
    notifyListeners();
  }

  //ham tim kiem
  void search(String keyword) {
    if (keyword.isEmpty) {
      danhSachDaTimKiem = danhSach;
    } else {
      danhSachDaTimKiem = danhSach
          .where(
              (item) => item.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
