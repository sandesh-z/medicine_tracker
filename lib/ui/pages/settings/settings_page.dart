import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/features/settings_cubit/settings_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';

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
      create: (_) => getIt<SettingsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.settings),
          backgroundColor: Colors.green.shade200,
        ),
        body: const SettingsListWidget(),
      ),
    );
  }
}

class SettingsListWidget extends StatefulWidget {
  const SettingsListWidget({super.key});

  @override
  State<SettingsListWidget> createState() => _SettingsListWidgetState();
}

class _SettingsListWidgetState extends State<SettingsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingItem(
          name: strings.change_language,
          icon: Icons.flag,
        ),
      ],
    );
  }
}

class SettingItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final void Function()? onTap;
  const SettingItem(
      {super.key, required this.name, required this.icon, this.onTap});

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return ShadowBoxWidget(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10.r),
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(widget.icon),
          SizedBox(width: 10.w),
          Text(
            widget.name,
            style: TextStyle(fontSize: 18.sp),
          ),
          const Spacer(),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Transform.scale(
                scale: 1.1,
                child: Switch(
                  trackColor:
                      MaterialStateProperty.all(const Color(0xffF7F6FB)),
                  activeThumbImage:
                      const AssetImage('assets/icons/united-kingdom.png'),
                  inactiveThumbImage:
                      const AssetImage("assets/icons/nepal.png"),
                  value: state.isEnglish,
                  onChanged: (value) {
                    getIt<AppLocalizationCubit>().changeLang(state.isEnglish
                        ? AppLocale.nepalese
                        : AppLocale.english);
                    getIt<SettingsCubit>().changeLanguageKey(value);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
