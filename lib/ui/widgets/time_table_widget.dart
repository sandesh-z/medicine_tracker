import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTableWidget extends StatelessWidget {
  const TimeTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time for taking Medicine",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          const TimeRowWidget(time: "6:00 am"),
          SizedBox(
            height: 10.h,
          ),
          const TimeRowWidget(time: "12:00 pm"),
          SizedBox(
            height: 10.h,
          ),
          const TimeRowWidget(
            time: "18:00 pm",
          ),
          SizedBox(
            height: 10.h,
          ),
          const TimeRowWidget(
            time: "12:00 pm",
          ),
        ],
      ),
    );
  }
}

class TimeRowWidget extends StatelessWidget {
  final String time;
  const TimeRowWidget({super.key, required this.time});

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
            time,
            style: TextStyle(fontSize: 23.sp, letterSpacing: 1),
          ),
          const Icon(Icons.calendar_month_outlined)
        ],
      ),
    );
  }
}
