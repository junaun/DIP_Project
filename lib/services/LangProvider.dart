import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class LangProvider with ChangeNotifier {
  String homeBar = "Smart Calculator";
  String plotBar = "Plot Functions";
  String settingBar = "Settings";
  String equationBar = "Equation Solver";

  LangController(int newSize) {}

  change2SCN() {
    homeBar = "大聪明计算器";
    plotBar = "函数画图";
    settingBar = "设置";
    equationBar = "解方程";
    notifyListeners();
  }

  change2EN() {
    homeBar = "Smart Calculartor";
    plotBar = "Plot Functions";
    settingBar = "Settings";
    notifyListeners();
  }
}
