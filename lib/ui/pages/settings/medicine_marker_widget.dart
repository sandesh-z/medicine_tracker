import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/ui/widgets/popup_success.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';

class MedicineMarkerWidget extends StatefulWidget {
  const MedicineMarkerWidget({super.key});
  @override
  State<MedicineMarkerWidget> createState() => _MedicineMarkerWidgetState();
}

class _MedicineMarkerWidgetState extends State<MedicineMarkerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
              color: Palette.primaryBackground1.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: Text(
                  strings.when_can_mark,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10.h),
              RadioItem(
                value: ValidTime.five,
                groupValue: state.validTime,
                title: strings.five_min_before,
                onChanged: (ValidTime? value) async {
                  getIt<SettingsCubit>().saveCurrentDiff(
                      MedicineFrequencyParser.parseValidMarker(value));

                  await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) => PopScope(
                            canPop: false,
                            child: PopUpSuccessOverLay(
                                title: strings.settings_changed,
                                bthTitle: strings.go_home,
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
                groupValue: state.validTime,
                title: strings.ten_min_before,
                onChanged: (ValidTime? value) async {
                  getIt<SettingsCubit>().saveCurrentDiff(
                      MedicineFrequencyParser.parseValidMarker(value));
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) => PopScope(
                            canPop: false,
                            child: PopUpSuccessOverLay(
                                title: strings.settings_changed,
                                bthTitle: strings.go_home,
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
                value: ValidTime.fifteen,
                groupValue: state.validTime,
                title: strings.fifteen_min_before,
                onChanged: (ValidTime? value) {
                  getIt<SettingsCubit>().saveCurrentDiff(
                      MedicineFrequencyParser.parseValidMarker(value));
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) => PopScope(
                            canPop: false,
                            child: PopUpSuccessOverLay(
                                title: strings.settings_changed,
                                bthTitle: strings.go_home,
                                onPressed: () async {
                                  await context.router.pushAndPopUntil(
                                    const HomeRoute(),
                                    predicate: (_) => false,
                                  );
                                }),
                          ));
                },
              ),
            ],
          ),
        );
      },
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
