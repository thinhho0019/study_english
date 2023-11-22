import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study_english/ui/ui_manghinhchinh.dart';
import 'package:flutter_study_english/ui/ui_question.dart';
import 'package:provider/provider.dart';

class providerTimeNext extends ChangeNotifier {
  int _seconds = 2;
  Timer? _timer;

  void startTimer(BuildContext context) {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        timer.cancel();
        print("run run");
        _timer = null;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => mainManghinhchinh(),
          ),
        );
      }
    });
  }
}
