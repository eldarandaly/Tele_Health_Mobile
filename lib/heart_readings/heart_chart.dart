import 'dart:async';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:telehealthcare/bottom_bar_nav/src/theme/extention.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/text_styles.dart';
import '../API/api_calls.dart';

class HeartRateChart extends StatelessWidget {
  late List<charts.Series<dynamic, num>> seriesList;
  final bool animate;

  HeartRateChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
          includeArea: false,
          stacked: false,
          strokeWidthPx: 3,
          includePoints: false),
      domainAxis: const charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
        viewport: charts.NumericExtents(0, 10),
      ),
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
                charts.OutsideJustification.middleDrawArea),
        charts.SlidingViewport(),
        charts.PanAndZoomBehavior(),
      ],
    );
  }
}

class HeartRateSeries {
  final num time;
  final num rate;

  HeartRateSeries(this.time, this.rate);
}

class HeartRateLineChart extends StatefulWidget {
  @override
  _HeartRateLineChartState createState() => _HeartRateLineChartState();
}

class _HeartRateLineChartState extends State<HeartRateLineChart> {
  @override
  void initState() {
    super.initState();
    // call the _refreshPage function every 1 second
    Timer.periodic(Duration(seconds: 1), (timer) => _refreshPage());
  }

  void _refreshPage() {
    setState(() {});
  }

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
            charts.Series<HeartRateSeries, num>(
              id: 'HeartRate',
              colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
              domainFn: (HeartRateSeries hr, _) => hr.time,
              measureFn: (HeartRateSeries hr, _) => hr.rate,
              data: myHeartRateData,
            ),
          ];

          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(18, 18, 18, 0.95),
                // border: Border.all(color: Colors.black),
                // borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Heart Rate',
                          style: TextStyles.titleMedium.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:
                                    HeartRateChart(seriesList, animate: false),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please use your Ecg Device to Mointor Your Heart Rate Signle ",
                style: TextStyles.h2Style,
              ),
              Divider(),
              CircularProgressIndicator(),
            ],
          );
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
            charts.Series<HeartRateSeries, num>(
              id: 'HeartRate',
              colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
              domainFn: (HeartRateSeries hr, _) => hr.time,
              measureFn: (HeartRateSeries hr, _) => hr.rate,
              data: myHeartRateData,
            ),
          ];

          return Scaffold(
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
                        child: HeartRateChart(seriesList, animate: false)),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Tell The Paient To use There Place There Ecg Decive ",
                style: TextStyles.h2Style,
              ),
              Divider(),
              CircularProgressIndicator(),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
