import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTableWidget extends StatelessWidget {
  final int medicineFrequency;
  const TimeTableWidget({super.key, required this.medicineFrequency});

  @override
  Widget build(BuildContext context) {
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
                return const TimeRowWidget(time: "6:00 am");
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
