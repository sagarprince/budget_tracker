import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MonthLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MonthLineChart(this.seriesList, {this.animate});

  factory MonthLineChart.withRandomData() {
    return new MonthLineChart(_createRandomData(), animate: true);
  }

  /// Create random data.
  static List<charts.Series<LinearTransaction, num>> _createRandomData() {
    final random = new Random();

    final data = [
      new LinearTransaction(1, random.nextInt(500)),
      new LinearTransaction(2, random.nextInt(200)),
      new LinearTransaction(3, random.nextInt(300)),
      new LinearTransaction(4, random.nextInt(400)),
      new LinearTransaction(5, random.nextInt(500)),
      new LinearTransaction(6, random.nextInt(600)),
      new LinearTransaction(7, random.nextInt(700)),
      new LinearTransaction(8, random.nextInt(800)),
      new LinearTransaction(9, random.nextInt(900)),
    ];

    return [
      new charts.Series<LinearTransaction, int>(
        id: 'Transactions',
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
        domainFn: (LinearTransaction transaction, _) => transaction.day,
        measureFn: (LinearTransaction transaction, _) => transaction.amount,
        labelAccessorFn: (LinearTransaction transaction, _) => '${transaction.amount}',
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
        seriesList,
        animate: animate,
        flipVerticalAxis: false,
        defaultRenderer: new charts.LineRendererConfig(
            includeLine: true,
            includePoints: true,
            radiusPx: 5.0,
            includeArea: true,
        ),
        behaviors: [

        ]
    );
  }
}

/// Sample linear data type.
class LinearTransaction {
  final int day;
  final int amount;

  LinearTransaction(this.day, this.amount);
}