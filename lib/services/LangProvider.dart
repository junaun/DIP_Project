import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class LangProvider with ChangeNotifier {
  String homeBar = "Smart Calculator";
  String plotBar = "Functions Plotting";
  String settingBar = "Settings";
  String equationBar = "Equation Solver";
  String colorSetting = "Color";
  String fontSetting = "Fonts";
  String langSetting = "Language";
  String modeSetting = "Exam Mode";
  String angleSetting = "Angle Unit";
  String calcSetting = "Calculation precision";
  String keyboardIcon = "Keyboard";
  String calcbotIcon = "Calcboard";

  LangController(int newSize) {}

  change2SCN() {
    homeBar = "科学计算器";
    plotBar = "函数画图";
    settingBar = "设置";
    equationBar = "解方程";
    colorSetting = "外观";
    fontSetting = "字体";
    langSetting = "语言";
    modeSetting = "考试模式";
    angleSetting = "角度单位";
    calcSetting = "计算精度";
    keyboardIcon = "键盘";
    calcbotIcon = "语音机器人";
    notifyListeners();
  }

  change2EN() {
    homeBar = "Smart Calculartor";
    plotBar = "Plot Functions";
    settingBar = "Settings";
    equationBar = "Equation Solver";
    colorSetting = "Color";
    fontSetting = "Fonts";
    langSetting = "Language";
    modeSetting = "Exam Mode";
    angleSetting = "Angle Unit";
    calcSetting = "Calculation precision";
    notifyListeners();
  }
}
