import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/ui/pages/missed_medicines/pie_chart_widget.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Column(children: [
          PieChartWidget(list: list, diff: state.validDiff),
          ...list.map((e) => MissedMedicineItem(
                medicineName: e.medicineName,
                frequency: e.frequency,
                times: MedicineFrequencyParser.getMissedTime(
                    e.schedule.split(','),
                    (e.allMedicineTakenList?.trim().isEmpty ?? false)
                        ? []
                        : e.allMedicineTakenList?.split(',') ?? [],
                    state.validDiff),
              ))
        ]);
      },
    );
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
            BoldTitleWithRichText(
              title: "${strings.med_name}: ",
              value: medicineName,
              boldSubtitleLightly: true,
              italicValue: true,
              valueColor: Palette.primaryBackground1,
            ),
            BoldTitleWithRichText(
              title: "${strings.missed} : ",
              value: "${times.length} ${strings.times}",
              valueColor: Colors.red,
            ),
            BoldTitleWithRichText(
              title: "${strings.missed_at}: ",
              value: times.join(','),
              valueColor: Colors.red,
            ),
            BoldTitleWithRichText(
              title: "${strings.total_med_taking_time}: ",
              value: "$frequency",
              valueColor: Colors.blue,
            ),
          ],
        ));
  }
}

class BoldTitleWithRichText extends StatelessWidget {
  final String title, value;
  final Color? titleColor, valueColor;
  final bool boldSubtitleLightly, italicValue;
  const BoldTitleWithRichText(
      {super.key,
      required this.title,
      required this.value,
      this.boldSubtitleLightly = false,
      this.titleColor,
      this.valueColor,
      this.italicValue = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
                fontWeight:
                    boldSubtitleLightly ? FontWeight.bold : FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black,
                fontSize: 14.sp),
            children: <TextSpan>[
              TextSpan(
                  text: value,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: valueColor ?? Colors.black,
                      fontStyle:
                          italicValue ? FontStyle.italic : FontStyle.normal,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }
}
