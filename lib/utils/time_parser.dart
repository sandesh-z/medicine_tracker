import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_tracker/core/localization/strings.dart';

String to24hourTime(String timeAsString) {
  int minute = int.tryParse(timeAsString.split(':').last.split(" ").first) ?? 0;
  int hour = int.tryParse(timeAsString.split(':').toList().first) ?? 0;

  DateTime dateTime = DateTime.now().copyWith(
      minute: minute, hour: hour, second: 0, millisecond: 0, microsecond: 0);

  if (timeAsString.contains("PM") && hour != 12) {
    dateTime = dateTime.add(const Duration(hours: 12));
  }

  //We can pass locale inside DateFormat as follows:
  //if we don't, it uses locale from localization
  //in this case: Nepali date will return without specifying locale
  String formattedDate =
      DateFormat('yyyy-MM-dd kk:mm:ss', 'en').format(dateTime);

  return formattedDate;
}

String parseTimeOfDay(TimeOfDay? timeOfDay, [bool forWidget = false]) {
  if (timeOfDay == null) return strings.select_time_here;

  var minute = (timeOfDay.minute % 60).toString().padLeft(2, '0');
  var hour = (timeOfDay.hour % 60).toString().padLeft(2, '0');
  return "$hour:$minute";
}
