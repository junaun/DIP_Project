import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:calculator/services/ColorProvider.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/backend/mathmodel.dart';

class KeyboardProvider with ChangeNotifier {
  List<Widget> button = [];
  var constants = {"A": 1.0, "B": 2.0, "C": 3.0};
  List<Widget> buildLowButton(MathBoxController mathBoxController) {
    for (MapEntry<String, double> constant in constants.entries) {
      String name = constant.key;
      double val = constant.value;
      button.add(MyButton(
        child: Text('$name'),
        onPressed: () {
          mathBoxController.addExpression('1');
        },
      ));
    }

    return button;
  }
}
