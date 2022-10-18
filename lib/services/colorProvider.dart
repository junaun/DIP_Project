import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color color = Colors.black;
  String name = "heyjude";

  colorController(Color color) {
    this.color = color;
  }

  getColor() {
    return this.color;
    notifyListeners();
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
