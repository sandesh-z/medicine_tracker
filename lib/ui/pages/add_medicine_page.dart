import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/pages/home/home_page.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/custom_dropdown.dart';
import 'package:medicine_tracker/ui/widgets/text_field_with_title.dart';
import 'package:medicine_tracker/ui/widgets/time_table_widget.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add medicine"),
        backgroundColor: Colors.green.shade200,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            TextFieldWithTitle(
              title: "Medicine Name",
              hintText: "Enter the name of the Medicine",
              controller: controller,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomDropdown(
              title: "How many times you should take this medicine during day?",
              itmes: AppConstants.medicineTimeitems,
              callback: (selectedItem) {
                if (selectedItem == null) return;

                context.read<AddMedicineBloc>().add(
                    AddMedicineEvent.changeMedicineTimeFrequency(
                        parseMedicineFrequency(selectedItem)));
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
                    medicineFrequency: state.medicineFrequency);
              },
            ),
            BlocBuilder<AddMedicineBloc, AddMedicineState>(
              builder: (context, state) {
                return TextButton(
                    onPressed: () async {
                      var details = MedicineDetails(
                          medicineName: controller.text,
                          frequency: state.medicineFrequency,
                          schedule: "6:00");
                      context
                          .read<AddMedicineBloc>()
                          .add(AddMedicineEvent.save(details));
                      context.router.replace(const HomeRoute());
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
    );
  }
}
