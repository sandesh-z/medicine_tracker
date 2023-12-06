import 'package:medicine_tracker/utils/time_parser.dart';

bool canCheck({required DateTime oldTime, required DateTime currentTime}) {
  int difference = ((oldTime.minute - currentTime.minute).abs());
  bool sameHour() => (oldTime.hour == currentTime.hour);

  if (difference <= 5 && sameHour()) {
    return true;
  }
  return false;
}

bool isScheduleMissed({required DateTime schedule, required String isChecked}) {
  DateTime now = DateTime.now();
  bool isMissed = schedule.isBefore(now);
  int diff = now.difference(schedule).inMinutes;

  if (isMissed && diff >= 10 && isChecked.contains('false')) {
    return true;
  }
  return false;
}

bool isAnyScheduleMissed(List<String> schedules, List<String> flags) {
  for (int j = 0; j < schedules.length; j++) {
    if (isScheduleMissed(
        isChecked: flags.isEmpty ? "false" : flags[j],
        schedule: DateTime.parse(to24hourTime(schedules[j])))) {
      return true;
    }
  }
  return false;
}
