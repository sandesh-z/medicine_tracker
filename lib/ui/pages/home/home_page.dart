import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medicine_tracker/core/notification/notification_service.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';

import 'package:medicine_tracker/ui/pages/home/medicine_list.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/ui/widgets/shadow_box_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    NotificationService.startListeningNotificationEvents();
    context
        .read<AddMedicineBloc>()
        .add(const AddMedicineEvent.getAllMedicine());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryBackground1,
      appBar: AppBar(
        backgroundColor: Palette.primaryBackground1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.r),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medicine Tracker',
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
                Text(
                  'Never miss to take medicine again.',
                  style: TextStyle(
                      color: Colors.white.withOpacity(.4),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.1),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Palette.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(45.r))),
        child: SafeArea(
          child: BlocBuilder<AddMedicineBloc, AddMedicineState>(
            builder: (blocCtx, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Palette.primaryBackground1),
                );
              }
              if ((state.allMedicineList?.isEmpty ?? false) && state.success) {
                return Center(
                    child: ShadowBoxWidget(
                  color: Palette.primaryBackground1,
                  margin: EdgeInsets.all(20.r),
                  child: Text(
                    "Please click add icon below to add medicine that you should take daily.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(21.r, 20.r, 21.r, 10.r),
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: Palette.primaryBackground4.withOpacity(.8),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30.r))),
                    child: Row(
                      children: [
                        Text(
                          "Today's Schedule : ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Palette.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RawScrollbar(
                      thickness: 8,
                      thumbVisibility: true,
                      trackVisibility: true,
                      radius: Radius.circular(8.r),
                      thumbColor: Palette.primaryBackground2,
                      child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.r, vertical: 0),
                          child:
                              MedicineList(list: state.allMedicineList ?? [])),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Palette.primaryBackground1,
        color: Colors.white,
        items: const [
          TabItem(icon: Icons.assessment),
          TabItem(icon: Icons.add, title: "Add medicine"),
          TabItem(
            icon: Icons.list,
          ),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          switch (i) {
            case 0:
              context.router.push(const MissedMedicineRoute());
              break;
            case 1:
              context.router.push(const AddMedicineRoute());
              break;
            case 2:
              context.router.push(const SettingsRoute());
              break;
          }
        },
      ),
    );
  }
}
