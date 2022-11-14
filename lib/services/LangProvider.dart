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
  String polynomial = "Polynomial";
  String linear = "Linear";
  String quadratic = "Quadratic";
  String cubic = "Cubic";
  String quartic = "Quartic";
  String complicatedfunctions = "Complicated Functions";
  String simulequation = "Simultaneous Equations";
  String calculus = "Calculus";
  String diffrentiation = "Differentiation";
  String integration = "Integration";
  String twounknown = "Two Unknowns";
  String threeunknown = "Three Unknowns";

  LangProvider() {
    //homeBar = "Smart Calculator";
  }

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
    polynomial = "多项式";
    linear = "线性函数";
    quadratic = "二次函数";
    cubic = "三次函数";
    quartic = "四次函数";
    complicatedfunctions = "复杂函数";
    simulequation = "多项式";
    calculus = "算术";
    diffrentiation = "求导";
    integration = "积分";
    twounknown = "二未知数";
    threeunknown = "三未知数";
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
    polynomial = "Polynomial";
    linear = "Linear";
    quadratic = "Quadratic";
    cubic = "Cubic";
    quartic = "Quartic";
    complicatedfunctions = "Complicated Functions";
    simulequation = "Simultaneous Equations";
    calculus = "Calculus";
    diffrentiation = "Differentiation";
    integration = "Integration";
    twounknown = "Two Unknowns";
    threeunknown = "Three Unknowns";

    notifyListeners();
  }
}
