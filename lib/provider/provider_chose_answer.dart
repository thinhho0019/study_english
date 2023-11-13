import 'package:flutter/material.dart';
import 'package:flutter_study_english/model/category.dart';
import 'package:flutter_study_english/model/question.dart';
import 'package:flutter_study_english/utils/dbhelper.dart';

class providerAnswer extends ChangeNotifier {
  int _anwserIndex = -1;
  int _indexList = -1;
  int get getanwser => _anwserIndex;

  List<question> cate = [];
  late question qt =
      question(id: -1, title: '1', a: '1', b: '1', c: '1', d: '1', result: '1',image: null);

  void selectIndex(int index) {
    if (_anwserIndex == -1) {
      _anwserIndex = index;
      print(_anwserIndex);
      notifyListeners();
    }
  }

  void getQuestion(int id) async {
    DbHelper dp = DbHelper();
    cate = await dp.getAllAsk(id);

    qt = cate[0];
    _indexList = 0;
    print(cate.length);
    notifyListeners();
  }

  void nextQuestion(BuildContext context) {
    if (_indexList == cate.length - 1) {
      showMessage(context);
    } else {
      _indexList += 1;
      _anwserIndex = -1;
      qt = cate[_indexList];
      notifyListeners();
    }
  }

  void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Announcement ...'),
          content: Text('Questions are out'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
