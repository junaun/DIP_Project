import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class ColorController {
  Color color = Colors.black;

  colorController(Color color) {
    this.color = color;
  }

  changeColor(String newcolor) {
    if (newcolor == "black") {
      color = Colors.black;
    }
    if (newcolor == "white") {
      color = Colors.white;
    }
  }
}
