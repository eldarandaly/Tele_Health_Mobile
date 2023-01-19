import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' show TextDirection;

import '../API/screen.dart';

class HeartRateChart extends StatelessWidget {
  final List<charts.Series<dynamic, int>> seriesList;
  final bool animate;
  final GetReading getReads = GetReading();

  HeartRateChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    // var chartData = getReads.getData();
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
    // final GetReading getReads = GetReading();
    var chartData = GetReading.getData();
    final data = chartData;
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
