import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

import '../customPage.dart';

class ConstantProvider with ChangeNotifier {
  List<User> allUsers = <User>[
    User(quantity: 'Gravitational Acceleration', value: '9.8', unit: 'g'),
    User(quantity: 'Mass of Earth', value: '5.97 x 10^24', unit: 'kg'),
    User(quantity: 'Unit gas constant', value: '8.314', unit: 'J/mol K'),
    User(
        quantity: 'Acceleration due to gravitity',
        value: '9.81',
        unit: 'm/s\u00B2'),
    User(quantity: 'Speed of light', value: '3 x 10^8', unit: 'm/s'),
    User(quantity: 'electron charge', value: '-1.602 x 10^-19', unit: 'C'),
    User(quantity: 'electron rest mass', value: '9.109 x 10^-31', unit: 'kg'),
    User(quantity: "planck's constant", value: '6.626 x 10^-34', unit: 'J/s'),
    User(quantity: 'atomic mass constant', value: '1.66 x 10^-27', unit: 'kg'),
    User(
        quantity: 'Gravitational Constant',
        value: '6.674 x 10^-11',
        unit: 'Nm\u00B2/kg\u00B2'),
  ];
  update(List<User> users) {
    this.allUsers = users;
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
