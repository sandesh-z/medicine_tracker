import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/ui/widgets/custom_popup_widget.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:medicine_tracker/utils/time_difference_checker.dart';
import 'package:medicine_tracker/utils/time_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicineDetailTile extends StatelessWidget {
  final MedicineDetails item;
  const MedicineDetailTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowBoxWidget(
        margin: EdgeInsets.fromLTRB(16.r, 0, 16.r, 15.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.medicineName,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Palette.primaryBackground5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => CustomDialog(
                        message:
                            "Are you sure you want to delete this medicine?",
                        title: "Confirmation",
                        showDismiss: true,
                        actionText: "Yes",
                        onAction: () async {
                          getIt<AddMedicineBloc>()
                              .add(AddMedicineEvent.delete(item.id ?? 0));
                          Navigator.pop(ctx);
                          await context.router.pushAndPopUntil(
                            const HomeRoute(),
                            predicate: (_) => false,
                          );
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red.withOpacity(.7),
                    size: 20.r,
                  ),
                ),
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
  int diff = 5;
  Future<int> getCurrentDiff() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int diff = prefs.getInt(AppConstants.markingDurationKey) ?? 5;
    return diff;
  }

  getDiff() async {
    diff = await getCurrentDiff();
    setState(() {});
  }

  @override
  void initState() {
    getDiff();
    super.initState();
  }

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
        checkColor: Palette.primaryBackground1,
        onChanged: (checked) {
          final now = DateTime.now();
          var parsed = to24hourTime(time);
          var oldDate = DateTime.parse(parsed);
          if (!canCheck(oldTime: oldDate, currentTime: now, diff: diff) &&
              !medicineTaken) {
            showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                message:
                    "You can only mark this medicine as taken $diff minutes before/after exact schedule",
                title: "Information",
                showDismiss: true,
                dismissText: strings.ok,
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
                  list = MedicineFrequencyParser.getListofStatus(
                          widget.medicineDetails.frequency)
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
        style: TextStyle(
            fontSize: 17.sp,
            color: Palette.primaryBackground4,
            fontWeight: FontWeight.w700),
      )
    ]);
  }
}
