import 'package:flutter/material.dart';
import 'Recording.dart' as record;
import 'Graph_plottor.dart';

final TextEditingController t1 = TextEditingController(text: "");
final TextEditingController t2 = TextEditingController(text: "");
final TextEditingController t3 = TextEditingController(text: "");
final TextEditingController t4 = TextEditingController(text: "");
final TextEditingController t5 = TextEditingController(text: "");
final TextEditingController t6 = TextEditingController(text: "");
final TextEditingController t7 = TextEditingController(text: "");

void doClear() {
  t1.text = "";
  t2.text = "";
  t3.text = "";
  t4.text = "";
  t5.text = "";
  t6.text = "";
  t7.text = "";
}

class quartic_graph extends StatefulWidget {
  const quartic_graph({Key? key}) : super(key: key);
  @override
  State<quartic_graph> createState() => quartic_graphState();
}

class quartic_graphState extends State<quartic_graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quartic function"),
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
                  "f(x) = a * x^4 + b * x^3 + c * x^2 + d * x + e",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.all(20.0)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for a"),
                  controller: t1,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for b"),
                  controller: t2,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for c"),
                  controller: t3,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for d"),
                  controller: t4,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: "Enter a value for e"),
                  controller: t5,
                ),
                const Text(
                  "Domain of x",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Min value"),
                  controller: t6,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Max value"),
                  controller: t7,
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
                            t4.text == "" ||
                            t5.text == "" ||
                            t6.text == "" ||
                            t7.text == "") {
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
                          double min = double.parse(t6.text);
                          double max = double.parse(t7.text);
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
                              'Quartic',
                              '${t1.text} * x^4 + ${t2.text} * x^3 + ${t3.text} * x^2 + ${t4.text} * x + ${t5.text}',
                              '${t6.text}',
                              '${t7.text}'
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
