import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/ui/widgets/custom_dropdown.dart';
import 'package:medicine_tracker/ui/widgets/custom_time_picker.dart';
import 'package:medicine_tracker/ui/widgets/text_field_with_title.dart';
import 'package:medicine_tracker/ui/widgets/time_table_widget.dart';

class AddMedicinePage extends StatelessWidget {
  const AddMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add medicine"),
        backgroundColor: Colors.green.shade200,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                const TextFieldWithTitle(
                  title: "Medicine Name",
                  hintText: "Enter the name of the Medicine",
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomDropdown(
                  title:
                      "How many times you should take this medicine during day?",
                  itmes: AppConstants.medicineTimeitems,
                ),
                const CustomTimePicker(),
                const TimeTableWidget(),
                TextButton(onPressed: () {}, child: const Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
