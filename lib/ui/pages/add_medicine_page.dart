import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add medicine"),
        backgroundColor: Colors.green.shade200,
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
                  title: "Medicine Name",
                  hintText: "Enter the name of the Medicine",
                  controller: controller,
                  validator: Validator.isNotEmpty,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomDropdown(
                  title:
                      "How many times you should take this medicine during day?",
                  itmes: AppConstants.medicineTimeitems,
                  initalValue: AppConstants.medicineTimeitems.first,
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
                BlocConsumer<AddMedicineBloc, AddMedicineState>(
                  listener: (ccontext, state) {
                    if (!state.isLoading && state.success) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => PopUpSuccessOverLay(
                              title: "Medicine Added",
                              bthTitle: "Goto Home Page",
                              onPressed: () {
                                context.router.replace(const HomeRoute());
                              }));
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

                    return TextButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            if (schedules.isEmpty) {
                              var snackBar = const SnackBar(
                                content: Text(
                                    'Please select time by clicking on icon.'),
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
                          "Save",
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
