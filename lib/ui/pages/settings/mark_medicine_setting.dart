import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/custom_dropdown.dart';
import 'package:medicine_tracker/utils/medicine_time_frequency_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class MarkMedicineSettingPage extends StatefulWidget {
  const MarkMedicineSettingPage({super.key});

  @override
  State<MarkMedicineSettingPage> createState() =>
      _MarkMedicineSettingPageState();
}

class _MarkMedicineSettingPageState extends State<MarkMedicineSettingPage> {
  saveMarkDuration(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(AppConstants.markingDurationKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text("Change marking duration"),
      ),
      body: Column(
        children: [
          CustomDropdown(
            title: "Can mark medicine as taken before/after: ",
            itmes: AppConstants.markingLists,
            initalValue: AppConstants.markingLists.first,
            callback: (selectedItem) {
              if (selectedItem == null) return;
              saveMarkDuration(
                  MedicineFrequencyParser.parseValidMarker(selectedItem));
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.replaceRoute(const HomeRoute());
              },
              child: const Text('Save'))
        ],
      ),
    );
  }
}
