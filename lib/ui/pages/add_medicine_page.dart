import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/ui/widgets/custom_dropdown.dart';
import 'package:medicine_tracker/ui/widgets/popup_success.dart';
import 'package:medicine_tracker/ui/widgets/text_field_with_title.dart';
import 'package:medicine_tracker/ui/widgets/time_table_widget.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:medicine_tracker/utils/validator.dart';

@RoutePage()
class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddMedicineBloc(getIt<GetMedicineDetails>()),
      child: const MedicineFormBody(),
    );
  }
}

class MedicineFormBody extends StatelessWidget {
  const MedicineFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    var formKey = GlobalKey<FormState>();

    List<String> schedules = [];
    bool isCurrentLanguageEnglish = getIt<AppLocalizationCubit>()
            .state
            .appLocale
            .locale
            .languageCode
            .compareTo('en') ==
        0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Palette.white),
        title: Text(
          strings.add_mediicne,
          style: TextStyle(color: Palette.white),
        ),
        backgroundColor: Palette.primaryBackground1,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.r),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldWithTitle(
                  title: strings.med_name,
                  hintText: strings.enter_name_of_med,
                  controller: controller,
                  validator: Validator.isNotEmpty,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomDropdown(
                  title: strings.how_many_times_med_take,
                  itmes: isCurrentLanguageEnglish
                      ? AppConstants.medicineTimeitems
                      : AppConstants.medicineTimeitemsNp,
                  initalValue: isCurrentLanguageEnglish
                      ? AppConstants.medicineTimeitems.first
                      : AppConstants.medicineTimeitemsNp.first,
                  callback: (selectedItem) {
                    if (selectedItem == null) return;

                    context.read<AddMedicineBloc>().add(
                        AddMedicineEvent.changeMedicineTimeFrequency(
                            MedicineFrequencyParser.parseMedicineFrequency(
                                selectedItem)));
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<AddMedicineBloc, AddMedicineState>(
                  buildWhen: (previous, current) =>
                      previous.medicineFrequency != current.medicineFrequency,
                  builder: (context, state) {
                    return TimeTableWidget(
                      key: state.key,
                      medicineFrequency: state.medicineFrequency,
                      onSave: (list) {
                        schedules = list;
                        debugPrint(schedules.toString());
                      },
                    );
                  },
                ),
                SizedBox(height: 20.h),
                BlocConsumer<AddMedicineBloc, AddMedicineState>(
                  listener: (ccontext, state) {
                    if (!state.isLoading && state.success) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => PopScope(
                                canPop: false,
                                child: PopUpSuccessOverLay(
                                    title: strings.medicine_added,
                                    bthTitle: strings.go_home,
                                    onPressed: () async {
                                      await context.router.pushAndPopUntil(
                                        const HomeRoute(),
                                        predicate: (_) => false,
                                      );
                                    }),
                              ));
                    }
                  },
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }

                    return ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            var list = schedules;
                            list.removeWhere((e) => e.trim().isEmpty);

                            if (schedules.isEmpty ||
                                list.length < state.medicineFrequency) {
                              var snackBar = SnackBar(
                                content: Text(strings.select_all_time),
                                backgroundColor: (Colors.red),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              return;
                            }

                            var details = MedicineDetails(
                                medicineName: controller.text,
                                frequency: state.medicineFrequency,
                                schedule: schedules.join(","));
                            context
                                .read<AddMedicineBloc>()
                                .add(AddMedicineEvent.save(details));
                          }
                        },
                        child: Text(
                          strings.save,
                          style: TextStyle(fontSize: 20.sp),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
