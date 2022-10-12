import 'package:flutter/material.dart';
import 'Recording.dart' as record;
import 'Graph_plottor.dart';

final TextEditingController t1 = TextEditingController(text: "");
final TextEditingController t2 = TextEditingController(text: "");
final TextEditingController t3 = TextEditingController(text: "");
void doClear() {
  t1.text = "";
  t2.text = "";
  t3.text = "";
}

class complicated_graph extends StatefulWidget {
  const complicated_graph({Key? key}) : super(key: key);
  @override
  State<complicated_graph> createState() => complicated_graphState();
}

class complicated_graphState extends State<complicated_graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complicated Function"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Function exprssions of f(x): ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: t1,
              keyboardType: TextInputType.text,
              decoration:
                  const InputDecoration(hintText: "Enter an expression of x"),
            ),
            const Text(
              "Domain of x",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Min value"),
              controller: t2,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Max value"),
              controller: t3,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Show Graph"),
                  onPressed: () {
                    if (t1.text == "" || t2.text == "" || t3.text == "") {
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
                      double min = double.parse(t2.text);
                      double max = double.parse(t3.text);
                      if (min >= max) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Reminder'),
                            content: const Text(
                                'Please make sure that min value is smaller than max value.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        record.past_plot.add([
                          'Complicated',
                          '${t1.text}',
                          '${t2.text}',
                          '${t3.text}'
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
    );
  }
}
