import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ValidTime { five, ten, fifteen }

/// This is the stateful widget that the main application instantiates.
class MedicineMarkerWidget extends StatefulWidget {
  const MedicineMarkerWidget({super.key});
  @override
  State<MedicineMarkerWidget> createState() => _MedicineMarkerWidgetState();
}

/// This is the private State class that goes with MedicineMarkerWidget.
class _MedicineMarkerWidgetState extends State<MedicineMarkerWidget> {
  ValidTime _validTime = ValidTime.five;
  saveMarkDuration(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(AppConstants.markingDurationKey, value);
  }

  @override
  void initState() {
    getRadioValues();
    super.initState();
  }

  getRadioValues() async {
    int time = await getRadioState();
    if (time == 10) {
      _validTime = ValidTime.ten;
    } else if (time == 15) {
      _validTime = ValidTime.fifteen;
    } else {
      _validTime = ValidTime.five;
    }
    setState(() {});
  }

  Future<int> getRadioState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int getValidTime = prefs.getInt(AppConstants.markingDurationKey) ?? 5;

    return getValidTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.r),
      color: Palette.primaryBackground1.withOpacity(.2),
      padding: EdgeInsets.all(10.r),
      child: Column(
        children: [
          const Text("Change duration when you can mark medicine as taken"),
          SizedBox(height: 10.h),
          RadioItem(
            value: ValidTime.five,
            groupValue: _validTime,
            title:
                "5 minutes before/after exact medicing taking time. (Default) ",
            onChanged: (ValidTime? value) {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
            },
          ),
          RadioItem(
            value: ValidTime.ten,
            groupValue: _validTime,
            title: "10 minutes before/after exact medicing taking time.  ",
            onChanged: (ValidTime? value) async {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
            },
          ),
          RadioItem(
            value: ValidTime.fifteen,
            groupValue: _validTime,
            title: "15 minutes before/after exact medicing taking time.  ",
            onChanged: (ValidTime? value) {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
            },
          ),
        ],
      ),
    );
  }
}

class RadioItem extends StatefulWidget {
  final String title;
  final ValidTime value;
  final ValidTime? groupValue;
  final ValueChanged<ValidTime?>? onChanged;

  const RadioItem(
      {super.key,
      required this.title,
      required this.value,
      this.groupValue,
      this.onChanged});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          key: UniqueKey(),
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
        ),
        SizedBox(width: 5.w),
        Expanded(child: Text(widget.title))
      ],
    );
  }
}
