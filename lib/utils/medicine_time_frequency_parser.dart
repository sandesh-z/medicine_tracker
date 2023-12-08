import 'package:medicine_tracker/utils/time_difference_checker.dart';
import 'package:medicine_tracker/utils/time_parser.dart';

class MedicineFrequencyParser {
  static int parseMedicineFrequency(String? name) {
    int medicineFrequency = 1;
    switch (name) {
      case "Once a day":
        medicineFrequency = 1;
        break;
      case "Twice a day":
        medicineFrequency = 2;
        break;
      case "3 times a day":
        medicineFrequency = 3;
        break;
      case "4 times a day":
        medicineFrequency = 4;
        break;
      default:
        medicineFrequency = 1;
    }
    return medicineFrequency;
  }

  static int parseValidMarker(String? name) {
    switch (name) {
      case "5 minutes before/after exact time (default)":
        return 5;
      case "10 minutes before/after exact time":
        return 10;
      case "15 minutes before/after exact time":
        return 15;

      default:
        return 5;
    }
  }

  static String getListofStatus(int frequency) {
    switch (frequency) {
      case 1:
        return "false";

      case 2:
        return "false,false";

      case 3:
        return "false,false,false";

      case 4:
        return "false,false,false,false";

      default:
        return "false";
    }
  }

  static List<String> getMissedTime(List<String> schedule, List<String> flags) {
    // assert(schedule.length==flags.length);

    schedule.removeWhere((e) => e.trim().isEmpty);

    for (int i = 0; i < schedule.length; i++) {
      if (flags.isEmpty) {
        if (!isScheduleMissed(
            schedule: DateTime.parse(to24hourTime(schedule[i])),
            isChecked: "false")) {
          schedule.removeAt(i);
        }
      } else if (flags[i].contains('true')) {
        schedule.removeAt(i);
      }
    }
    return schedule;
  }
}
