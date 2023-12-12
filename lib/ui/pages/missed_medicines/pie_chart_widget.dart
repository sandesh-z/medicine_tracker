import 'package:flutter/material.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  final List<MedicineDetails> list;

  const PieChartWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    Data calculate(List<MedicineDetails> list) {
      int total = 0;
      int missed = 0;

      for (int i = 0; i < list.length; i++) {
        total += list[i].frequency;
        missed = missed +
            MedicineFrequencyParser.getMissedTime(
                    list[i].schedule.split(','),
                    (list[i].allMedicineTakenList?.trim().isEmpty ?? false)
                        ? []
                        : list[i].allMedicineTakenList?.split(',') ?? [])
                .length;
      }
      return Data(total: total, missed: missed);
    }

    Data data = calculate(list);
    final List<ChartData> chartData = [
      ChartData('Total', data.total, Colors.blue),
      ChartData('Missed', data.missed, Colors.red),
      ChartData('Taken', data.total - data.missed, Palette.primaryBackground1),
    ];
    return Center(
        child: SfCircularChart(
            legend: const Legend(
              isVisible: true,
            ),
            series: <CircularSeries>[
          // Render pie chart
          PieSeries<ChartData, String>(
            explode: true,
            dataSource: chartData,
            pointColorMapper: (ChartData data, _) => data.color,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y == 0 ? null : data.y,
            dataLabelMapper: (ChartData data, _) => data.y.toString(),
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            selectionBehavior: SelectionBehavior(enable: true),
          )
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}

class Data {
  final int total;
  final int missed;

  Data({required this.total, required this.missed});
}
