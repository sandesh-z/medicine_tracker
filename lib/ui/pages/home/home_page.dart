import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/pages/home/medicine_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: ClipRRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Image.asset(
                    'assets/images/green-background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LanguageSelect(),
                  Text(
                    strings.hello_world,
                    style: TextStyle(fontSize: 25.spMin),
                  ),
                  TextButton(
                      onPressed: () {
                        context
                            .read<AddMedicineBloc>()
                            .add(const AddMedicineEvent.getAllMedicine());
                      },
                      child: const Text("Get medicine list")),
                  BlocBuilder<AddMedicineBloc, AddMedicineState>(
                    buildWhen: (previous, current) =>
                        previous.allMedicineList != current.allMedicineList,
                    builder: (context, state) {
                      if (state.allMedicineList?.isEmpty ?? false) {
                        return const SizedBox();
                      }
                      return MedicineList(list: state.allMedicineList ?? []);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.green.shade900,
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
          switch (i) {
            case 0:
              context
                  .read<AppLocalizationCubit>()
                  .changeLang(AppLocale.english);
              break;
            case 1:
              context.go('/add');
              break;
            case 2:
              break;
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
