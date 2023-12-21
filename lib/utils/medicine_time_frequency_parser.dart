import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/utils/time_difference_checker.dart';
import 'package:medicine_tracker/utils/time_parser.dart';

class MedicineFrequencyParser {
  static int parseMedicineFrequency(String? name) {
    int medicineFrequency = switch (name) {
      "Once a day" || "दिनमा एकपटक" => 1,
      "Twice a day" || "दिनको दुई पटक" => 2,
      "3 times a day" || "दिनको तीन पटक" => 3,
      "4 times a day" || "दिनको चार पटक" => 4,
      _ => 1
    };
    return medicineFrequency;
  }

  static int parseValidMarker(ValidTime? name) {
    final result = switch (name) {
      ValidTime.five => 5,
      ValidTime.ten => 10,
      ValidTime.fifteen => 15,
      _ => 5
    };
    return result;
  }

  static String getListofStatus(int frequency) {
    final result = switch (frequency) {
      1 => "false",
      2 => "false,false",
      3 => "false,false,false",
      4 => "false,false,false,false",
      _ => "false"
    };
    return result;
  }

  static List<String> getMissedTime(
      List<String> schedule, List<String> flags, int diff) {
    // assert(schedule.length==flags.length);

    schedule.removeWhere((e) => e.trim().isEmpty);

    for (int i = 0; i < schedule.length; i++) {
      if (flags.isEmpty) {
        if (!isScheduleMissed(
            schedule: DateTime.parse(to24hourTime(schedule[i])),
            isChecked: "false",
            validDiff: diff)) {
          schedule.removeAt(i);
        }
      } else if (flags[i].contains('true')) {
        schedule.removeAt(i);
      }
    }
    return schedule;
  }
}
