import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LanguageSelect(),
          Text(
            strings.hello_world,
            style: TextStyle(fontSize: 25.spMin),
          ),
        ],
      )),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.green,
        color: Colors.white,
        items: const [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.add, title: "Add medicine"),
          TabItem(
            icon: Icons.assessment,
          ),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          if (i == 0) {
            getIt<AppLocalizationCubit>().changeLang(AppLocale.english);
          }
        },
      ),
    );
  }
}

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLocalizationCubit, AppLocalizationState>(
      builder: (context, state) {
        return PopupMenuButton(
          padding: const EdgeInsets.only(top: 1, bottom: 1), //
          icon: SizedBox(
            height: 28,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    state.appLocale.locale.languageCode.toUpperCase() == 'EN'
                        ? 'ENGLISH'
                        : 'NEPALI',
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )),
          ),
          itemBuilder: (context) {
            return AppLocale.allLocales
                .map(
                  (e) => PopupMenuItem(
                    onTap: () {
                      getIt<AppLocalizationCubit>().changeLang(e);
                    },

                    // ),
                    child: Text(
                      e.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                )
                .toList();
          },
        );
      },
    );
  }
}
