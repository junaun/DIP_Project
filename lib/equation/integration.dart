import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/units_converter.dart';


Parser p = Parser();

void main() => runApp(const IntegrationApp());
final myController = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();
final myController4 = TextEditingController();


class IntegrationApp extends StatelessWidget {
  
  const IntegrationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Integration')),
          body: Column(children: [
         Row(
            children: [
              Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "\nInput Values for Integration\n",
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Upper Bound'
                          ))),
              
              Expanded(
                  child: TextFormField(
                    controller: myController2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Lower Bound'
                          ))),            
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: myController3,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: '\nEquation'
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
                  'calculate',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                
              String  A = myController.text;
              String B = myController2.text;
              double upper = double.parse(A);
              double lower = double.parse(B);
              String C = myController3.text;

                var simpson = SimpsonRule(
                function: C,
                lowerBound: lower,
                upperBound: upper);

                var results = simpson.integrate(); 
               var a = results.result.toStringAsFixed(3);
               myController4.text = a;
 
          
           }),
           
        )]
          ),

         Row(
            children: [
              Expanded(
                  child: TextFormField(
                    enabled: false,
                    controller: myController4,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Answer'
                          ))),
            ],
          ),
      
     
          ]
          )
          ),
      

      );}
  }


