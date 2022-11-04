import 'package:calculator/services/LangProvider.dart';
import 'package:flutter/material.dart';
import 'History.dart';
import 'Linear_plot.dart';
import 'Quadratic_plot.dart';
import 'Cubic_plot.dart';
import 'Quartic_plot.dart';
import 'Complicated_plot.dart';
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const History()));
              },
              child: const Icon(Icons.access_time),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Polynomial",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text(" Linear  "),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const linear_graph()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Quadratic"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const quadratic_graph()));
                  },
                ),
                ElevatedButton(
                  child: const Text("  Cubic  "),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const cubic_graph()));
                  },
                ),
                ElevatedButton(
                  child: const Text(" Quartic "),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const quartic_graph()));
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            const Text(
              "Complicated funtions",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const complicated_graph()));
                },
                child: const Text("Complicated")),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
