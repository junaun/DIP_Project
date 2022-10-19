import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class LangProvider with ChangeNotifier {
  String homeBar = "Smart Calculator";

  colorController(int newSize) {}

  change2SCN() {
    homeBar = "大聪明计算器";
    notifyListeners();
  }

  change2EN() {
    homeBar = "Smart Calculartor";
    notifyListeners();
  }
}
