import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:equations/equations.dart';
void main() => runApp(const ThreeUnknownApp());
final myController = TextEditingController();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 =TextEditingController();
final myController4 = TextEditingController();
final myController5 =TextEditingController();
final myController6 =TextEditingController();
final myController7 =TextEditingController();
final myController8 =TextEditingController();
final myController9 =TextEditingController();
final myController10 = TextEditingController();
final myController11 = TextEditingController();
final myController12 = TextEditingController();
final myController13 =TextEditingController();
final myController14 = TextEditingController();



class ThreeUnknownApp extends StatelessWidget {
  
  const ThreeUnknownApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Equation Sample')),
          body: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "X1+Y1+Z1=C1, X2+Y2+Z2=C2, X3+Y3+Z3=C3",
                     style: TextStyle(  
              fontSize: 20,  )
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
                          labelText: 'X1')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController1,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y1')
                          )
                          ),
               
               Expanded(
                  child: TextField(
                  controller: myController2,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Z1')
                          )
                          ),
              Expanded(
                  child: TextFormField(
                    controller: myController3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'C1'
                          )
                          )
                          ),
                         
            ],
          ),
        Row(
            children: [
              Expanded(
                  child: TextField(
                  controller: myController4,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X2')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController5,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y2')
                          )
                          ),

               Expanded(
                  child: TextFormField(
                    controller: myController6,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Z2'
                          )
                          )
                          ),
                                     
                          
              Expanded(
                  child: TextFormField(
                    controller: myController7,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'C2'
                          )
                          )
                          ),
                         
            ],
          ),

Row(
            children: [
              Expanded(
                  child: TextField(
                  controller: myController8,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X3')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController9,
                  keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y3')
                          )
                          ),

               Expanded(
                  child: TextFormField(
                    controller: myController10,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Z3'
                          )
                          )
                          ),
                                     
                          
              Expanded(
                  child: TextFormField(
                    controller: myController11,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'C3'
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
                  var f ="0";
                  var g ="0";
                  var h ="0";
                  var i ="0";
                  var j ="0";
                  var k ="0";
                  var l ="0";

                  a = myController.text;
                 var A = double.parse(a);

                  b = myController1.text;
                 double B = double.parse(b);

                  c = myController2.text;
                 double C = double.parse(c);

                  d = myController3.text;
                 double D = double.parse(d);

                 e = myController4.text;
                 double E = double.parse(e);

                f = myController5.text;
                 double F = double.parse(f);

                g = myController6.text;
                 double G = double.parse(g);
              
                h = myController7.text;
                 double H = double.parse(h);

                  i = myController8.text;
                 double I = double.parse(i);

                 j = myController9.text;
                 double J = double.parse(j);

                k = myController10.text;
                 double K = double.parse(k);

                l = myController11.text;
                 double L = double.parse(l);



                final matrixA = RealMatrix.fromData(
                  columns: 3,
                  rows: 3,
                  data:[
                  [A,B,C],
                  [E,F,G],
                  [I,J,K]  ]);
                
                final lu = LUSolver(
                  matrix: matrixA,
                  knownValues: [D,H,L]
                    );

               var ans = lu.solve();
               String newans = ans.toString();
               List<String> stringans = newans.split(',');
               String one = stringans[0];
               String newone = one.replaceAll("[", "");
               String two = stringans[1];
               String three =stringans[2];
               String newthree =three.replaceAll("]", "");
               myController12.text = newone.toString();
               myController13.text =two.toString();
               myController14.text = newthree.toString();
                
                              
          }),
           
        )]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextFormField(
                    enabled: false,
                  controller: myController12,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X = ')
                          ),
                          
                          ),  
                          Expanded(
                  child: TextFormField(
                    enabled: false,
                  controller: myController13,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y = ')
                          )
                          ), 
                          Expanded(
                  child: TextFormField(
                    enabled: false,
                  controller: myController14,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Z = ')
                          )
                          ),            
            ],
          ),
          ]
          )
          ),
      

      );}
  }


