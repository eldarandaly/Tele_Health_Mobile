import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' show TextDirection;

class HeartRateChart extends StatelessWidget {
  final List<charts.Series<dynamic, int>> seriesList;
  final bool animate;

  HeartRateChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer:
          charts.LineRendererConfig(includeArea: true, stacked: true),
      behaviors: [
        charts.ChartTitle('Time',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Heart Rate',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Beats per Minute (BPM)',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea)
      ],
    );
  }
}

class HeartRateSeries {
  final int time;
  final int rate;

  HeartRateSeries(this.time, this.rate);
}

class HeartRateLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      {'time': 1, 'rate': 80},
      {'time': 2, 'rate': 75},
      {'time': 3, 'rate': 85},
      {'time': 4, 'rate': 90},
      {'time': 5, 'rate': 88},
      {'time': 6, 'rate': 82},
      {'time': 7, 'rate': 70},
      {'time': 8, 'rate': 94},
      {'time': 9, 'rate': 120},
      {'time': 10, 'rate': 130},
    ];
    final myHeartRateData =
        data.map((e) => HeartRateSeries(e['time']!, e['rate']!)).toList();
    final seriesList = [
      charts.Series<HeartRateSeries, int>(
        id: 'HeartRate',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (HeartRateSeries hr, _) => hr.time,
        measureFn: (HeartRateSeries hr, _) => hr.rate,
        data: myHeartRateData,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Readings'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: HeartRateChart(seriesList, animate: true),
          ),
        ),
      ),
    );
  }
}
