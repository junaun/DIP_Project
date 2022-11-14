import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  List<String> history = [];

  update(String expression, String result) {
    history.add(expression + " = " + result);
    history.forEach((element) {
      print(element);
    });
    notifyListeners();
  }
}
