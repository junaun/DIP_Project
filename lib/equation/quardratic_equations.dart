import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';

void main() => runApp(const EquationApp());
final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();

class EquationApp extends StatelessWidget {
  const EquationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Quardratic Equation Solver')),
          body: Column(children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                        textAlign: TextAlign.center,
                        "\nSolve Quardratic Equation of \nAX\u00B2+Bx+C = 0\n",
                        style: TextStyle(
                          fontSize: 25,
                        ))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'A'))),
                Expanded(
                    child: TextFormField(
                        controller: myController2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'B'))),
                Expanded(
                    child: TextFormField(
                        controller: myController3,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'C'))),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                child: ElevatedButton(
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      var a = "0";
                      var b = "0";
                      var c = "0";
                      a = myController.text;
                      double A = double.parse(a);
                      b = myController2.text;
                      double B = double.parse(b);
                      c = myController3.text;
                      double C = double.parse(c);
                      var root = B * B - (4 * A * C);
                      if (root >= 0) {
                        var disc = sqrt(root);
                        double x1 = (-B - disc) / (2 * A);
                        double x2 = (-B + disc) / (2 * A);
                        double val1 = double.parse(x1.toString());
                        double val2 = double.parse(x2.toString());
                        String Newval1 = val1.toStringAsFixed(3);
                        String Newval2 = val2.toStringAsFixed(3);
                        myController4.text = Newval1;
                        myController5.text = Newval2;
                      } else {
                        root = root * (-1);
                        var discIM = sqrt(root) / (2 * A);
                        discIM.abs();
                        var discRE = (-B) / (2 * A);
                        double im = double.parse(discIM.toString());
                        double re = double.parse(discRE.toString());
                        String IM = im.toStringAsFixed(3);
                        String RE = re.toStringAsFixed(3);
                        String x3 = RE + '+' + IM + 'i';
                        String x4 = RE + '-' + IM + 'i';
                        myController4.text = x3;
                        myController5.text = x4;
                      }
                    }),
              )
            ]),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController4,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'X₁ = '))),
                Expanded(
                    child: TextFormField(
                        controller: myController5,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'X₂ = '))),
              ],
            ),
          ])),
    );
  }
}
