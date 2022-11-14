import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

import '../customPage.dart';

class ConstantProvider with ChangeNotifier {
  List<User> allUsers = <User>[
    User(quantity: 'Gravitational Acceleration', value: '9.8', unit: 'g'),
    User(quantity: 'Boltzmann constant', value: '1.38*10^{-23}', unit: 'Kb'),
    User(quantity: 'Coulomb Constant', value: '0.98*10^{-23} ', unit: 'Ke'),
    User(quantity: 'Acceleration due to gravitity', value: '9.81', unit: 'g'),
    User(quantity: 'Speed of light', value: '3 x 10^8', unit: 'c'),
    User(quantity: 'electron charge', value: '-1.602*10^{-19}', unit: 'e'),
    User(quantity: 'electronic mass', value: '9.109*10^{-31}', unit: 'm(e)'),
    User(
        quantity: "planck's constant", value: '6.626*10^{-34}', unit: 'Planck'),
    User(quantity: 'atomic mass constant', value: '1.66*10^{-27}', unit: 'M'),
    User(
        quantity: 'Newton Gravitation Constant',
        value: '6.674*10^{-11}',
        unit: 'G'),
  ];

  update(List<User> users) {
    this.allUsers = users;
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
