import 'dart:math';

import 'package:calculator/equation/equation_type.dart';
import 'package:calculator/unitConvert_new.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:equations/equations.dart';
void main() => runApp(const TwoUnknownApp());
final myController = TextEditingController();
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 =TextEditingController();
final myController4 = TextEditingController();
final myController5 =TextEditingController();
final myController6 =TextEditingController();
final myController7 =TextEditingController();
final myController8 =TextEditingController();


class TwoUnknownApp extends StatelessWidget {
  
  const TwoUnknownApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('2 unknowns'),
                leading: IconButton(
                onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Typeselection()));
                },
                icon:Icon(Icons.arrow_back_ios), 
                //replace with our own icon data.
            )
        ),
        
          body:
          Container(
        padding: const EdgeInsets.all(20.0),
          
           child : Column(children: [
         Row(
            children: [
              Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "\nX1+Y1=C1\nX2+Y2=C2",
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
                  inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X1')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController1,
                  keyboardType: TextInputType.number,
                   inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y1')
                          )
                          ),
              Expanded(
                  child: TextFormField(
                    controller: myController2,
                      keyboardType: TextInputType.number,
                       inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
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
                  controller: myController3,
                  keyboardType: TextInputType.number,
                   inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X2')
                          )
                          ),
              Expanded(
                  child: TextField(
                  controller: myController4,
                  keyboardType: TextInputType.number,
                   inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y2')
                          )
                          ),
              Expanded(
                  child: TextFormField(
                    controller: myController5,
                      keyboardType: TextInputType.number,
                       inputFormatters: [DecimalTextInputFormatter(),FilteringTextInputFormatter.deny(RegExp(r'[\s\,[\.\.]]')),],
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'C2'
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
              
                final matrixA = RealMatrix.fromData(
                  columns: 2,
                  rows: 2,
                  data:[
                  [A,B],
                  [D,E]  ]);
                
                final lu = LUSolver(
                  matrix: matrixA,
                  knownValues: [C,F]
                    );

               var ans = lu.solve();
               String newans = ans.toString();
               List<String> stringans = newans.split(',');
               String one = stringans[0];
               String newone = one.replaceAll("[", "");
               String two = stringans[1];
               String newtwo =two.replaceAll("]", "");
               myController6.text = newone.toString();
               myController7.text = newtwo.toString();
                
                              
          }),
           
        )]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: TextFormField(
                    enabled: false,
                  controller: myController6,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'X = ')
                          )
                          ),  
                    
                    Expanded(
                  child: TextFormField(
                    enabled: false,
                  controller: myController7,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Y = ')
                          )
                          ),           
                                      
            ],
          ),]
          )
          ),
      

      ));}
  }


