import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color color = Colors.black;
  String name = "heyjude";
  int fontSize = 25;

  colorController(Color color) {
    this.color = color;
  }

  toggleDarkMode() {}

  getColor() {
    return this.color;
    //notifyListeners();
  }

  changeFontSize(int newSize) {
    fontSize = newSize;
  }

  changeName() {
    this.name = "hey";
    notifyListeners();
  }

  changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }
}
