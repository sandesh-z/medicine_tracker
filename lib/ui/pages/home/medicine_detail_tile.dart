import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/ui/widgets/custom_popup_widget.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:medicine_tracker/utils/time_difference_checker.dart';
import 'package:medicine_tracker/utils/time_parser.dart';

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
                          medicineDetails: item,
                          index: index,
                        );
                      }),
                )
              ],
            )
          ],
        ));
  }
}

class CheckboxWithTime extends StatefulWidget {
  final int index;
  final MedicineDetails medicineDetails;
  const CheckboxWithTime({
    super.key,
    required this.medicineDetails,
    required this.index,
  });

  @override
  State<CheckboxWithTime> createState() => _CheckboxWithTimeState();
}

class _CheckboxWithTimeState extends State<CheckboxWithTime> {
  late String time =
      widget.medicineDetails.schedule.split(',').toList()[widget.index];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    bool medicineTaken = (widget.medicineDetails.allMedicineTakenList == null ||
            widget.medicineDetails.allMedicineTakenList?.isEmpty == true)
        ? false
        : widget.medicineDetails.allMedicineTakenList!
                .split(',')
                .toList()[widget.index]
                .contains('true')
            ? true
            : false;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Checkbox(
        value: medicineTaken || isChecked,
        checkColor: Colors.green,
        onChanged: (checked) {
          final now = DateTime.now();
          var parsed = to24hourTime(time);
          var oldDate = DateTime.parse(parsed);
          if (!canCheck(oldTime: oldDate, currentTime: now)) {
            showDialog(
              context: context,
              builder: (BuildContext context) => const CustomDialog(
                message:
                    "You can only check this medicine around 5 minutes before/after medicine taking time",
                title: "Information",
                showDismiss: true,
                dismissText: "OK",
              ),
            );
            return;
          }
          if (isChecked || medicineTaken) return;
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomDialog(
              message:
                  "You can not undo this action. Are you sure you have taken the medicine?",
              title: "Information",
              showDismiss: true,
              actionText: "Yes",
              onAction: () {
                List<String> list = [];
                if (widget.medicineDetails.allMedicineTakenList?.isEmpty ??
                    true) {
                  list = getListofStatus(widget.medicineDetails.frequency)
                      .split(',')
                      .toList();
                } else {
                  list = widget.medicineDetails.allMedicineTakenList!
                      .split(',')
                      .toList();
                }
                list[widget.index] = "true";
                context.read<AddMedicineBloc>().add(AddMedicineEvent.update(
                    widget.medicineDetails.id ?? 0, list.toString()));
                setState(() {
                  isChecked = true;
                });
                Navigator.pop(context);
              },
            ),
          );
        },
        fillColor: MaterialStateProperty.all(Colors.white),
      ),
      Text(
        time,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      )
    ]);
  }
}
