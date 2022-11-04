import 'package:calculator/backend/keyboardPlotting.dart';
import 'package:flutter/material.dart';
import 'Recording.dart' as record;
import 'Graph_plottor.dart';

final TextEditingController t1 = TextEditingController(text: "");
final TextEditingController t2 = TextEditingController(text: "");
final TextEditingController t3 = TextEditingController(text: "");
final TextEditingController t4 = TextEditingController(text: "");

void doClear() {
  t1.text = "";
  t2.text = "";
  t3.text = "";
  t4.text = "";
}

class linear_graph extends StatefulWidget {
  const linear_graph({Key? key}) : super(key: key);
  @override
  State<linear_graph> createState() => linear_graphState();
}

class linear_graphState extends State<linear_graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Linear function"),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Function",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "f(x) = a * x + b",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.all(20.0)),
                TextField(
                  controller: t1,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for a"),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for b"),
                  controller: t2,
                ),
                const Text(
                  "Domain of x",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Min value"),
                  controller: t3,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Max value"),
                  controller: t4,
                ),
                const Padding(padding: EdgeInsets.all(20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("Show Graph"),
                      onPressed: () {
                        if (t1.text == "" ||
                            t2.text == "" ||
                            t3.text == "" ||
                            t4.text == "") {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Reminder'),
                              content: const Text(
                                  'Please do not leave the blanks empty.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          double min = double.parse(t3.text);
                          double max = double.parse(t4.text);
                          if (min >= max) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Reminder'),
                                content: const Text(
                                    'Please make sure that min value is smaller than max value.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            record.past_plot.add([
                              'Linear',
                              '${t1.text} * x + ${t2.text}',
                              '${t3.text}',
                              '${t4.text}'
                            ]);
                            record.counter = record.counter + 1;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Graph_plotter()));
                          }
                        }
                      },
                    ),
                    const ElevatedButton(
                      onPressed: doClear,
                      child: Text("Clear"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
