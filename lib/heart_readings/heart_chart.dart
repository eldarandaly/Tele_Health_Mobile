// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/src/text_element.dart' show TextDirection;
import 'package:telehealthcare/new_home/src/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import '../API/api_calls.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
      defaultRenderer: charts.LineRendererConfig(
          includeArea: false,
          stacked: false,
          strokeWidthPx: 3,
          includePoints: true),
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

// class HeartRateLineChart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final GetReading getReads = GetReading();
//     var chartData = getReads.getData();
//     final data = [
//       {'time': 0, 'rate': 70},
//       {'time': 1, 'rate': 80},
//       {'rate': 85, 'time': 2},
//       {'time': 3, 'rate': 95},
//       {'rate': 94, 'time': 4},
//       {'time': 5, 'rate': 99},
//       {'time': 6, 'rate': 100},
//       {'time': 7, 'rate': 115},
//       {'time': 8, 'rate': 100},
//       {'rate': 121, 'time': 9},
//       {'rate': 130, 'time': 10},
//       {'time': 11, 'rate': 125},
//       {'time': 12, 'rate': 113},
//       {'rate': 134, 'time': 13},
//       {'rate': 142, 'time': 14}
//     ];
//     final myHeartRateData =
//         data.map((e) => HeartRateSeries(e['time']!, e['rate']!)).toList();
//     final seriesList = [
//       charts.Series<HeartRateSeries, int>(
//         id: 'HeartRate',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (HeartRateSeries hr, _) => hr.time,
//         measureFn: (HeartRateSeries hr, _) => hr.rate,
//         data: myHeartRateData,
//       ),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart Readings'),
//       ),
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.8,
//           height: MediaQuery.of(context).size.height * 0.8,
//           child: Center(
//             child: HeartRateChart(seriesList, animate: true),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HeartRateLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: GetReading().getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          // map the data to the HeartRateSeries class
          final myHeartRateData = data!
              .map((e) => HeartRateSeries(e['time']!, e['rate']!))
              .toList();

          // create the series list
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
            // appBar: AppBar(
            //   title: const Text("TeleHealthCare",
            //       style: TextStyle(
            //           color: Colors.blueAccent, fontWeight: FontWeight.w800)),
            //   backgroundColor: Colors.white,
            //   centerTitle: true,
            // ),
            body: Center(
              child: SizedBox(
                // height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Your Heart Rate Readings From The ECG Device',
                        style: TextStyles.h1Style,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: HeartRateChart(seriesList, animate: true)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class AllHeartRateLineChart extends StatelessWidget {
  final String personEmail;
  const AllHeartRateLineChart({Key? key, required this.personEmail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: GetReading().getAllCharts(personEmail),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          // map the data to the HeartRateSeries class
          final myHeartRateData = data!
              .map((e) => HeartRateSeries(e['time']!, e['rate']!))
              .toList();

          // create the series list
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
            // appBar: AppBar(
            //   title: const Text("TeleHealthCare",
            //       style: TextStyle(
            //           color: Colors.blueAccent, fontWeight: FontWeight.w800)),
            //   backgroundColor: Colors.white,
            //   centerTitle: true,
            // ),
            body: Center(
              child: SizedBox(
                height: 500,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: HeartRateChart(seriesList, animate: true)),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class TimeSeriesEcg {
  final double ecg;
  final double time;

  TimeSeriesEcg(this.ecg, this.time);
}

// class ECGChart extends StatelessWidget {
//   final seriesList = [
//     new charts.Series<TimeSeriesEcg, double>(
//       id: 'ECG',
//       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//       domainFn: (TimeSeriesEcg ecg, _) => ecg.time,
//       measureFn: (TimeSeriesEcg ecg, _) => ecg.ecg,
//       data: [
//         TimeSeriesEcg(1, 5),
//         TimeSeriesEcg(2, 25),
//         TimeSeriesEcg(3, 100),
//         TimeSeriesEcg(4, 75),
//       ],
//     ),
//   ];
//   final bool animate = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new charts.LineChart(seriesList,
//           defaultRenderer: new charts.LineRendererConfig(includePoints: true),
//           animate: animate),
//     );
//   }
// }
class gggg extends StatelessWidget {
  final List<Series<TimeSeriesEcg, double>> seriesList;
  final bool animate;
  final GetReading getReads = GetReading();

  gggg(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    // var chartData = getReads.getData();
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
          includeArea: false,
          stacked: false,
          strokeWidthPx: 3,
          includePoints: true),
      behaviors: [
        charts.ChartTitle('Time',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Heart Rate',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.PanAndZoomBehavior(),
      ],
    );
  }
}

class ECGChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: GetReading().getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // final data = snapshot.data;
          List<TimeSeriesEcg> data = [];
          Random random = new Random();

          for (double j = 1; j <= 100; j++) {
            double i = random.nextDouble() + random.nextDouble() * 100;
            data.add(TimeSeriesEcg(i, j));
          }
          // create the series list
          final seriesList = [
            new charts.Series<TimeSeriesEcg, double>(
              id: 'ECG',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (TimeSeriesEcg ecg, _) => ecg.time,
              measureFn: (TimeSeriesEcg ecg, _) => ecg.ecg,
              data: data,
            ),
          ];

          return Scaffold(
            // appBar: AppBar(
            //   title: const Text("TeleHealthCare",
            //       style: TextStyle(
            //           color: Colors.blueAccent, fontWeight: FontWeight.w800)),
            //   backgroundColor: Colors.white,
            //   centerTitle: true,
            // ),
            body: Center(
              child: SizedBox(
                // height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Your Heart Rate Readings From The ECG Device',
                        style: TextStyles.h1Style,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: gggg(seriesList, animate: true)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
