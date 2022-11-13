import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorProvider with ChangeNotifier {
  Color color = Colors.black;
  int fontSize = 25;
  // Future changeSlider(double val) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   precision = val;
  //   prefs.setDouble('precision', precision.toDouble());
  //   notifyListeners();
  // }

  ColorProvider() {
    initVal();
  }
  colorController(Color color) {
    this.color = color;
  }

  toggleDarkMode() {}

  getColor() {
    return this.color;
    //notifyListeners();
  }

  Future changeColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.color = color;
    String colorString = color.toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    //prefs.setInt(key, value)
    prefs.setInt("color", value);
    notifyListeners();
  }

  Future initVal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? colorInt = prefs.getInt("color");
    this.color = Color(colorInt!);

    notifyListeners();
  }
}
