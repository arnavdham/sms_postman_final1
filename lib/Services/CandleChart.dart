import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({Key? key}) : super(key: key);

  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  late bool _enableSolidCandle;
  late bool _toggleVisibility;
  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _enableSolidCandle = true; // Set to true for solid fill
    _toggleVisibility = true;
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          child: _buildCandle()),
    );
  }

  SfCartesianChart _buildCandle() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'AAPL - 2016'),
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.MMM(),
        interval: 3,
        intervalType: DateTimeIntervalType.months,
        minimum: DateTime(2016),
        maximum: DateTime(2016, 10),
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        desiredIntervals: 5,

      ),
      primaryYAxis: NumericAxis(
        minimum: 80,
        maximum: 120,
        interval: 10,
        labelFormat: r'${value}',
        axisLine: const AxisLine(width: 0),
        majorGridLines: const MajorGridLines(width: 1),
        majorTickLines: const MajorTickLines(width: 1),
        desiredIntervals: 4,
      ),
      axes: <ChartAxis>[
        NumericAxis(
          opposedPosition: true,
          majorGridLines: const MajorGridLines(width: 0),
          labelFormat: r'${value}',
          minimum: 0,
          maximum: 80, // Adjust this value as needed
          name: 'SecondaryAxis',
        ),
      ],
      series: <ChartSeries>[
        CandleSeries<CandleData, DateTime>(
          enableSolidCandles: _enableSolidCandle,
          dataSource: <CandleData>[
            CandleData(x: DateTime(2016, 01, 11), open: 100, high: 105, low: 95, close: 98),
            CandleData(x: DateTime(2016, 01, 18), open: 98, high: 102, low: 92, close: 101),
            CandleData(x: DateTime(2016, 01, 25), open: 101, high: 105, low: 95, close: 97),
            CandleData(x: DateTime(2016, 02, 08), open: 97, high: 100, low: 94, close: 99),
            CandleData(x: DateTime(2016, 02, 22), open: 99, high: 103, low: 95, close: 101),
            CandleData(x: DateTime(2016, 03, 07), open: 101, high: 107, low: 100, close: 105),
            // Add more candle data points as needed
          ],
          name: 'AAPL',
          showIndicationForSameValues: _toggleVisibility,
          xValueMapper: (CandleData data, _) => data.x as DateTime,
          lowValueMapper: (CandleData data, _) => data.low,
          highValueMapper: (CandleData data, _) => data.high,
          openValueMapper: (CandleData data, _) => data.open,
          closeValueMapper: (CandleData data, _) => data.close,

        ),
        ColumnSeries<VolumeData, DateTime>(
          dataSource: <VolumeData>[
            VolumeData(x: DateTime(2016, 01, 11), y: 50), // Adjust volume data points as needed
            VolumeData(x: DateTime(2016, 01, 18), y: 30),
            VolumeData(x: DateTime(2016, 01, 25), y: 60),
            VolumeData(x: DateTime(2016, 02, 08), y: 40),
            VolumeData(x: DateTime(2016, 02, 22), y: 70),
            VolumeData(x: DateTime(2016, 03, 07), y: 50),
            // Add more volume data points as needed
          ],
          xValueMapper: (VolumeData data, _) => data.x as DateTime,
          yValueMapper: (VolumeData data, _) => data.y,
          yAxisName: 'SecondaryAxis',
        ),
      ],
      trackballBehavior: _trackballBehavior,
    );
  }
}

class CandleData {
  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;

  CandleData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}

class VolumeData {
  final DateTime x;
  final double y;

  VolumeData({
    required this.x,
    required this.y,
  });
}