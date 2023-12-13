import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/features/settings/domain/usecases/get_settings.dart';
import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/pages/settings/medicine_marker_widget.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt<GetAllSettings>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            strings.settings,
            style: TextStyle(color: Palette.white),
          ),
          iconTheme: IconThemeData(color: Palette.white),
          backgroundColor: Palette.primaryBackground1,
        ),
        body: Column(
          children: [
            SettingItem(
              name: strings.change_language,
              icon: Icons.flag,
              languageToggle: true,
            ),
            const MedicineMarkerWidget(),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function()? onTap;
  final bool languageToggle;
  const SettingItem(
      {super.key,
      required this.name,
      required this.icon,
      this.onTap,
      this.languageToggle = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.switchState != current.switchState,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 10.r),
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 5.h),
          decoration: BoxDecoration(
              color: Palette.primaryBackground1.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    name,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                if (languageToggle) ...[
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      trackColor:
                          MaterialStateProperty.all(const Color(0xffF7F6FB)),
                      activeThumbImage:
                          const AssetImage('assets/icons/nepal.png'),
                      inactiveThumbImage:
                          const AssetImage("assets/icons/united-kingdom.png"),
                      value: state.switchState,
                      onChanged: (value) {
                        context.read<SettingsCubit>().saveSwitchState(value);
                        context.read<AppLocalizationCubit>().changeLang(
                            value ? AppLocale.nepalese : AppLocale.english);
                      },
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
