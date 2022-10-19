import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class FontProvider with ChangeNotifier {
  double fontSize = 25;
  String fontFamily = "Regular";

  colorController(double newSize) {
    this.fontSize = newSize;
  }

  getSize() {
    return this.fontSize;
    //notifyListeners();
  }

  changeFontSize(double newSize) {
    fontSize = newSize;
    notifyListeners();
  }

  changeFontFamily(String newFamily) {
    this.fontFamily = newFamily;
    notifyListeners();
  }
}
