import 'package:flutter/material.dart';
import 'package:calculator/equations.dart';
import 'package:equations/equations.dart' as equa;

void main() => runApp(const CubicEquationApp());
final myController = TextEditingController();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();
final myController5 = TextEditingController();
final myController6 = TextEditingController();
final myController7 = TextEditingController();
final myController8 = TextEditingController();

class CubicEquationApp extends StatelessWidget {
  const CubicEquationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Equation Sample')),
          body: Column(children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: myController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'AX3'))),
                Expanded(
                    child: TextField(
                        controller: myController1,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'BX2'))),
                Expanded(
                    child: TextFormField(
                        controller: myController2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'CX'))),
                Expanded(
                    child: TextFormField(
                        controller: myController3,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), labelText: 'D'))),
              ],
            ),
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                child: ElevatedButton(
                    child: Text(
                      'Compute',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      var a = "0";
                      var b = "0";
                      var c = "0";
                      var d = "0";
                      a = myController.text;
                      double A = double.parse(a);
                      b = myController1.text;
                      double B = double.parse(b);
                      c = myController2.text;
                      double C = double.parse(c);
                      d = myController3.text;
                      double D = double.parse(d);

                      final equation = equa.Cubic.realEquation(
                        a: A,
                        b: B,
                        c: C,
                        d: D,
                      );

                      var ans = equation.solutions();
                      String newans = ans.toString();
                      List<String> poh = newans.split(',');
                      String one = poh[0];
                      String newone = one.replaceAll("[", "");
                      String two = poh[1];
                      String three = poh[2];
                      String newthree = three.replaceAll("]", "");
                      myController5.text = newone.toString();
                      myController6.text = two.toString();
                      myController7.text = newthree.toString();
                    }),
              )
            ]),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController5,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'X₁ = '))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController6,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'X₁ = '))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController7,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'X₁ = '))),
              ],
            ),
          ])),
    );
  }
}
