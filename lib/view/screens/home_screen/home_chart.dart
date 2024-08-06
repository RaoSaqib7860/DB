import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/dashboard_model.dart';

class LineChartSample2 extends StatefulWidget {
  final DashBoardModel? dashboardModel;
  const LineChartSample2({super.key, this.dashboardModel});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  final List<ChartData> chartData = [];
  @override
  void initState() {
    widget.dashboardModel!.data!.orders!.forEach((element) {
      chartData.add(ChartData('${element.month}', element.sales!.toDouble()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
