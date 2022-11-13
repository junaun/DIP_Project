import 'package:calculator/services/LangProvider.dart';
import 'package:flutter/material.dart';
import 'package:calculator/equation/cubic_equations.dart';
import 'package:calculator/equation/differentiation.dart';
import 'package:calculator/equation/integration.dart';
import 'package:calculator/equation/quardratic_equations.dart';
import 'package:calculator/equation/quartic_equations.dart';
import 'package:calculator/equation/ThreeUnknown.dart';
import 'package:calculator/equation/TwoUnknown.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';

class Typeselection extends StatefulWidget {
  const Typeselection({Key? key}) : super(key: key);

  @override
  State<Typeselection> createState() => TypeselectionState();
}

class TypeselectionState extends State<Typeselection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<ColorProvider>(context, listen: false).color,
        title: Text(Provider.of<LangProvider>(context, listen: false).plotBar,
            style: TextStyle(
                fontSize: Provider.of<FontProvider>(context).fontSize)),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) => const History()));
        //       },
        //       child: const Icon(Icons.access_time),
        //     ),
        //   )
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              Provider.of<LangProvider>(context, listen: false).polynomial,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                      Provider.of<LangProvider>(context, listen: false).linear),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CubicEquationApp()));
                  },
                ),
                ElevatedButton(
                  child: Text(Provider.of<LangProvider>(context, listen: false)
                      .quadratic),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EquationApp()));
                  },
                ),
                ElevatedButton(
                  child: Text(
                      Provider.of<LangProvider>(context, listen: false).cubic),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QuarticEquationApp()));
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            Text(
              Provider.of<LangProvider>(context, listen: false)
                  .complicatedfunctions,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                      Provider.of<LangProvider>(context, listen: false).linear),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TwoUnknownApp()));
                  },
                ),
                ElevatedButton(
                  child: Text(Provider.of<LangProvider>(context, listen: false)
                      .quadratic),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThreeUnknownApp()));
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            Text(
              Provider.of<LangProvider>(context, listen: false)
                  .complicatedfunctions,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                      Provider.of<LangProvider>(context, listen: false).linear),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const IntegrationApp()));
                  },
                ),
                ElevatedButton(
                  child: Text(Provider.of<LangProvider>(context, listen: false)
                      .quadratic),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DifferentiationApp()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
