import 'package:calculator/equation/equation_type.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/units_converter.dart';


Parser p = Parser();
const parser = ExpressionParser();

void main() => runApp(const DifferentiationApp());
final myController = TextEditingController();
final myController2 = TextEditingController();


class DifferentiationApp extends StatelessWidget {
  
  const DifferentiationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Differntiation'),
        leading: IconButton(
                onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Typeselection()));
                },
                icon:Icon(Icons.arrow_back_ios), 
                //replace with our own icon data.
            )
        ),
          body: Container(
                  padding: const EdgeInsets.all(20.0),
          
           child :Column(children: [
         Row(
            children: [
              Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "\nInput Equation for Differntiation\n",
                     style: TextStyle(  
              fontSize: 25,  )
                          )
                          ),            
            ],
          ),
         Row(
            children: [
              Expanded(
                  child: TextFormField(
                      controller: myController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Equation'
                          ))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: myController2,
                    enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Derivative'
                          ))),
            ],
          ),
        


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                Expression derived =p.parse(myController.text);
                Expression simplified = derived.simplify();
                Expression ans = simplified.derive('x');
                String ans_string = ans.toString();
                 myController2.text =  ans_string;
  }),
           
        )]
          ),
     
          ]
          )
          ),
      

      ));}
  }


