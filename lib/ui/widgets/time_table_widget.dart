import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTableWidget extends StatelessWidget {
  final int medicineFrequency;
  final void Function(List<String>) onSave;
  const TimeTableWidget(
      {super.key, required this.medicineFrequency, required this.onSave});

  @override
  Widget build(BuildContext context) {
    List<String> schedules = ["", "", "", ""];
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Time for taking Medicine",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: medicineFrequency,
              itemBuilder: (context, index) {
                return TimeRowWidget(
                  time: (time) {
                    schedules.removeAt(index);
                    schedules.insert(
                        index,
                        time?.format(context) ??
                            TimeOfDay.now().format(context));
                    onSave(schedules);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimeRowWidget extends StatefulWidget {
  final void Function(TimeOfDay?) time;

  const TimeRowWidget({super.key, required this.time});

  @override
  State<TimeRowWidget> createState() => _TimeRowWidgetState();
}

class _TimeRowWidgetState extends State<TimeRowWidget> {
  TimeOfDay? pickedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pickedTime?.format(context) ?? "Select time here >",
            style: TextStyle(
                fontSize: pickedTime == null ? 18.sp : 23.sp,
                letterSpacing: 1,
                color: pickedTime == null
                    ? Colors.black.withOpacity(.7)
                    : Colors.black),
          ),
          InkWell(
              onTap: () async {
                pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        timePickerTheme: TimePickerTheme.of(context).copyWith(
                          backgroundColor: Colors.green.shade100,
                          dialHandColor: Colors.green,
                        ),
                      ),
                      child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child ?? const SizedBox(),
                      ),
                    );
                  },
                );

                widget.time(pickedTime);
                setState(() {});
              },
              child: const Icon(Icons.calendar_month_outlined))
        ],
      ),
    );
  }
}
