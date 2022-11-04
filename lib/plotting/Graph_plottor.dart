import 'package:flutter/material.dart';
import 'Recording.dart' as record;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:math_expressions/math_expressions.dart';

class Graph_plotter extends StatefulWidget {
  const Graph_plotter({Key? key}) : super(key: key);
  @override
  State<Graph_plotter> createState() => Graph_plotterState();
}

class Graph_plotterState extends State<Graph_plotter> {
  double min = double.parse(record.past_plot[record.counter - 1][2]);
  double max = double.parse(record.past_plot[record.counter - 1][3]);
  Variable x = Variable("x");
  Expression exp = Parser().parse(record.past_plot[record.counter - 1][1]);
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
    for (double i = 0; i <= 500; i++) {
      double value = min + (max - min) * i / 500;
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
