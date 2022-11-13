import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class LockProvider with ChangeNotifier {
  bool isLockEquation = false;
  bool isLockMatrix = false;
  bool isLockPlot = false;

  lockAll(bool value) {
    isLockEquation = value;
    isLockPlot = value;
    isLockMatrix = value;
    notifyListeners();
  }

  lockEquation(bool value) {
    isLockEquation = value;
    notifyListeners();
  }

  lockMatrix(bool value) {
    isLockMatrix = value;
    notifyListeners();
  }

  lockPlot(bool value) {
    isLockPlot = value;
    notifyListeners();
  }

  getLockEquation() {
    return this.isLockEquation;
  }
}
