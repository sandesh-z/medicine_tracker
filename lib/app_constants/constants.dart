import 'package:medicine_tracker/core/localization/strings.dart';

class AppLocalizationConstants {
  static const hasSelectedEnglish = 'has_selected_english';
}

class AppConstants {
  static List<String> medicineTimeitems = [
    strings.once_a_day,
    strings.once_a_day,
    strings.twice_a_day,
    strings.thrice_a_day,
    strings.four_times_a_day,
  ];
  // static const List<String> medicineTimeitems = [
  //   'Once a day',
  //   'Twice a day',
  //   '3 times a day',
  //   '4 times a day',
  // ];
  static List<String> markingLists = [
    strings.five_min_before,
    strings.ten_min_before,
    strings.fifteen_min_before,
  ];
  //  static const List<String> markingLists = [
  //   '5 minutes before/after exact time (default)',
  //   '10 minutes before/after exact time',
  //   '15 minutes before/after exact time',
  // ];
  static const String markingDurationKey = "marking_duration";
  static const String switchState = "swtich_state";
}
