import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class LockProvider with ChangeNotifier {
  bool isLockEquation = false;

  lockEquation() {
    isLockEquation = true;
    notifyListeners();
  }

  unlockEquation() {
    isLockEquation = false;
    notifyListeners();
  }

  getLockEquation() {
    return this.isLockEquation;
  }
}
