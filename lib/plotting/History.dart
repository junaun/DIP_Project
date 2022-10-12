import 'package:flutter/material.dart';
import 'Recording.dart' as record;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:math_expressions/math_expressions.dart';

void doDelete(int number) {
  record.past_plot.removeAt(number);
  record.counter = record.counter - 1;
}

late int N;

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);
  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    if (record.counter > 100) {
      for (int k = 0; k < 100; k++) {
        record.past_plot[k] = record.past_plot[record.counter - 100 + k];
      }
      record.counter = 100;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = record.counter - 1; i >= 0; i--) ...[
                Container(
                    height: 100,
                    color: Colors.blue[100],
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Text('${record.past_plot[i][0]} function',
                                style: TextStyle(fontSize: 20)),
                            Spacer(),
                            ElevatedButton(
                                child: Text('Graph',
                                    style: TextStyle(fontSize: 18)),
                                onPressed: () {
                                  N = i;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Graph_plotter()));
                                }),
                            ElevatedButton(
                                onPressed: () {
                                  doDelete(i);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const History()));
                                },
                                child: Text('Delete',
                                    style: TextStyle(fontSize: 18))),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('f(x)= ${record.past_plot[i][1]}',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'domain: [${record.past_plot[i][2]}, ${record.past_plot[i][3]}]',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )
                      ],
                    )),
                Padding(padding: EdgeInsets.all(5))
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class Graph_plotter extends StatefulWidget {
  const Graph_plotter({Key? key}) : super(key: key);
  @override
  State<Graph_plotter> createState() => Graph_plotterState();
}

class Graph_plotterState extends State<Graph_plotter> {
  double min = double.parse(record.past_plot[N][2]);
  double max = double.parse(record.past_plot[N][3]);
  Variable x = Variable("x");
  Expression exp = Parser().parse(record.past_plot[N][1]);
  late ZoomPanBehavior _zoomPanBehavior;
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      enableDoubleTapZooming: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipSettings: const InteractiveTooltip(format: '(point.x, point.y)'),
      activationMode: ActivationMode.longPress,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[];
    for (double i = 0; i <= 400; i++) {
      double value = min + (max - min) * i / 400;
      ContextModel cm = ContextModel()..bindVariable(x, Number(value));
      double y = exp.evaluate(EvaluationType.REAL, cm);
      chartData.add(ChartData(value, y));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Graph"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: SfCartesianChart(
            primaryXAxis: NumericAxis(minimum: min, maximum: max, crossesAt: 0),
            primaryYAxis: NumericAxis(crossesAt: 0),
            zoomPanBehavior: _zoomPanBehavior,
            trackballBehavior: _trackballBehavior,
            series: <ChartSeries>[
              // Renders spline chart
              SplineSeries<ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
