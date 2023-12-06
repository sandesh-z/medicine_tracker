import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';

class MissedMedicineList extends StatelessWidget {
  final List<MedicineDetails> list;

  const MissedMedicineList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20.h,
      ),
      ...list.map((e) => MissedMedicineItem(
            medicineName: e.medicineName,
            frequency: e.frequency,
            times: MedicineFrequencyParser.getMissedTime(
                e.schedule.split(','),
                (e.allMedicineTakenList?.trim().isEmpty ?? false)
                    ? []
                    : e.allMedicineTakenList?.split(',') ?? []),
          ))
    ]);
  }
}

class MissedMedicineItem extends StatelessWidget {
  final String medicineName;
  final List<String> times;
  final int frequency;
  const MissedMedicineItem(
      {super.key,
      required this.medicineName,
      required this.frequency,
      required this.times});

  @override
  Widget build(BuildContext context) {
    return ShadowBoxWidget(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 7.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [Text(medicineName)],
            ),
            Row(
              children: [Text("Missed : ${times.length} times")],
            ),
            Row(
              children: [Text("Missed at: ${times.join(',')}")],
            ),
            Row(
              children: [Text("Total medicine taking time: $frequency")],
            )
          ],
        ));
  }
}
