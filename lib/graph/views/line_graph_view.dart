import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/data_model.dart';

class LineGraph extends StatelessWidget {
  const LineGraph({Key? key, required this.data}) : super(key: key);

  final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datum, DateTime>> series = [
      //Draw graph for xAcc in color Red
      charts.Series<Datum, DateTime>(
        id: "xAcc",
        data: data,
        domainFn: (Datum series, _) => series.datetime,
        measureFn: (Datum series, _) => series.xAcc,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),

      //Draw graph for yAcc in color Blue
      charts.Series<Datum, DateTime>(
        id: "yAcc",
        data: data,
        domainFn: (Datum series, _) => series.datetime,
        measureFn: (Datum series, _) => series.yAcc,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),

      //Draw graph for zAcc in color Green
      charts.Series<Datum, DateTime>(
        id: "zAcc",
        data: data,
        domainFn: (Datum series, _) => series.datetime,
        measureFn: (Datum series, _) => series.zAcc,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];

//Time Series Chart to use dateTime as the x-Axis
    return charts.TimeSeriesChart(
      series,
      animate: true,
      defaultRenderer: charts.LineRendererConfig(),
    );
  }
}
