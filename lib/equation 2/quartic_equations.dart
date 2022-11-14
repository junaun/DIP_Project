import 'dart:math';

import 'package:calculator/equation/equation_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:equations/equations.dart';
void main() => runApp(const QuarticEquationApp());
final myController = TextEditingController();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 =TextEditingController();
final myController4 = TextEditingController();
final myController5 =TextEditingController();
final myController6 =TextEditingController();
final myController7 =TextEditingController();
final myController8 =TextEditingController();


class QuarticEquationApp extends StatelessWidget {
  
  const QuarticEquationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Quartic Eqaution Solver'),
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
          
           child :
          Column(children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Solve Quartic Equation of \nAX\u2074+Bx\u00B3+Cx\u00B2+DX+E = 0",
                     style: TextStyle(  
              fontSize: 25,  )
                          )
                          ),            
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'A')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController1,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'B')
                          )
                          ),
              Expanded(
                  child: TextFormField(
                    controller: myController2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'C'
                          )
                          )
                          ),

                          Expanded(
                  child: TextFormField(
                    controller: myController3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'D'
                          )
                          )
                          ),
                          
                          Expanded(
                  child: TextFormField(
                    controller: myController4,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'E'
                          )
                          )
                          ),
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
                  var a ="0";
                  var b ="0";
                  var c ="0";
                  var d ="0";
                  var e ="0";
                  a = myController.text;
                 double A = double.parse(a);
                  b = myController1.text;
                 double B = double.parse(b);
                  c = myController2.text;
                 double C = double.parse(c);
                  d = myController3.text;
                 double D = double.parse(d);
                 e = myController3.text;
                 double E = double.parse(e);
                
                final equation = Quartic.realEquation(
                  a :A,
                  b :B,
                  c :C,
                  d :D,
                  e :E,

                );

               var ans = equation.solutions();
               String newans = ans.toString();
               List<String> stringans = newans.split(',');
               String one = stringans[0];
               String newone = one.replaceAll("[", "");
               String two = stringans[1];
               String three = stringans[2];
               String four = stringans[3];
               String newfour =four.replaceAll("]", "");
               myController5.text = newone.toString();
               myController6.text = two.toString();
               myController7.text = three.toString();
               myController8.text = newfour.toString();
                
                              
          }),
           
        )]
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                  controller: myController5,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X₁ = ')
                          )
                          ),              
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
                          labelText: 'X\u2082 = ')
                          )
                          ),                
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
                          labelText: 'X\u2083 = ')
                          )
                          ),                
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                  controller: myController8,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X\u2084 = ')
                          )
                          ),                
            ],
          ),
          ]
          )
          ),
      

      ));}
  }


