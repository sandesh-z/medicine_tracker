import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/pages/settings/medicine_marker_widget.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings.settings,
          style: TextStyle(color: Palette.white),
        ),
        iconTheme: IconThemeData(color: Palette.white),
        backgroundColor: Palette.primaryBackground1,
      ),
      body: const SettingsListWidget(),
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
          languageToggle: true,
        ),
        const MedicineMarkerWidget(),
      ],
    );
  }
}

class SettingItem extends StatefulWidget {
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
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool isSwitched = false;
  @override
  void initState() {
    getSwitchValues();
    super.initState();
  }

  getSwitchValues() async {
    isSwitched = await getSwitchState();
    setState(() {});
  }

  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT =
        prefs.getBool(AppLocalizationConstants.hasSelectedEnglish) ?? false;

    return isSwitchedFT;
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppLocalizationConstants.hasSelectedEnglish, value);
    return prefs.setBool(AppLocalizationConstants.hasSelectedEnglish, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 10.r),
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 5.h),
      decoration: BoxDecoration(
          color: Palette.primaryBackground1.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(widget.icon),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            if (widget.languageToggle) ...[
              Transform.scale(
                scale: 1.1,
                child: Switch(
                  trackColor:
                      MaterialStateProperty.all(const Color(0xffF7F6FB)),
                  activeThumbImage: const AssetImage('assets/icons/nepal.png'),
                  inactiveThumbImage:
                      const AssetImage("assets/icons/united-kingdom.png"),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      saveSwitchState(value);
                    });

                    getIt<AppLocalizationCubit>().changeLang(
                        value ? AppLocale.nepalese : AppLocale.english);
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
