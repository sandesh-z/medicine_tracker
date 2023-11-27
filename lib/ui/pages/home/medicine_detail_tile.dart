import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';

class MedicineDetailTile extends StatelessWidget {
  final MedicineDetails item;
  const MedicineDetailTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowBoxWidget(
        margin: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  item.medicineName,
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: item.frequency,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CheckboxWithTime(
                          time: item.schedule.split(',').toList()[index],
                        );
                      }),
                )
              ],
            )
          ],
        ));
  }
}

class CheckboxWithTime extends StatelessWidget {
  final String time;
  const CheckboxWithTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Checkbox(
        value: false,
        onChanged: (checked) {},
        fillColor: MaterialStateProperty.all(Colors.white),
      ),
      Text(
        time,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      )
    ]);
  }
}
