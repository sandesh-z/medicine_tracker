import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/ui/widgets/popup_success.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ValidTime { five, ten, fifteen }

class MedicineMarkerWidget extends StatefulWidget {
  const MedicineMarkerWidget({super.key});
  @override
  State<MedicineMarkerWidget> createState() => _MedicineMarkerWidgetState();
}

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
      margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
          color: Palette.primaryBackground1.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      child: Column(
        children: [
          Text(
            "Duration when you can mark medicine as taken.",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          RadioItem(
            value: ValidTime.five,
            groupValue: _validTime,
            title: "5 minutes before/after exact schedule. (Default) ",
            onChanged: (ValidTime? value) {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => PopScope(
                        canPop: false,
                        child: PopUpSuccessOverLay(
                            title: "Settings Changed",
                            bthTitle: "Goto Homepage",
                            onPressed: () async {
                              await context.router.pushAndPopUntil(
                                const HomeRoute(),
                                predicate: (_) => false,
                              );
                            }),
                      ));
            },
          ),
          RadioItem(
            value: ValidTime.ten,
            groupValue: _validTime,
            title: "10 minutes before/after exact schedule.  ",
            onChanged: (ValidTime? value) async {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => PopScope(
                        canPop: false,
                        child: PopUpSuccessOverLay(
                            title: "Settings Changed",
                            bthTitle: "Goto Homepage",
                            onPressed: () {
                              context.replaceRoute(const HomeRoute());
                            }),
                      ));
            },
          ),
          RadioItem(
            value: ValidTime.fifteen,
            groupValue: _validTime,
            title: "15 minutes before/after exact schedule.  ",
            onChanged: (ValidTime? value) {
              _validTime = value ?? ValidTime.five;
              setState(() {});
              saveMarkDuration(MedicineFrequencyParser.parseValidMarker(value));
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => PopScope(
                        canPop: false,
                        child: PopUpSuccessOverLay(
                            title: "Settings Changed",
                            bthTitle: "Goto Homepage",
                            onPressed: () {
                              context.replaceRoute(const HomeRoute());
                            }),
                      ));
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
        Expanded(
            child: Text(
          widget.title,
          style: TextStyle(fontSize: 13.sp),
        ))
      ],
    );
  }
}
