import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/units_converter.dart';

Parser p = Parser();

void main() => runApp(const DeriveApp());
final myController = TextEditingController();
final myController2 = TextEditingController();

class DeriveApp extends StatelessWidget {
  const DeriveApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('DropdownButton Sample')),
          body: Column(children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Input'))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: myController2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Output'))),
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
                      Expression Valueone = p.parse(myController.text);
                      Expression qw = Valueone.simplify();
                      Expression derived = qw.derive('x').simplify();
                      Expression ad = derived.simplify();
                      String ac = ad.toString();
                      myController2.text = ac;
                    }),
              )
            ]),
          ])),
    );
  }
}
