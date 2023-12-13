import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String to24hourTime(String timeAsString) {
  int minute = int.tryParse(timeAsString.split(':').last.split(" ").first) ?? 0;
  int hour = int.tryParse(timeAsString.split(':').toList().first) ?? 0;

  DateTime dateTime = DateTime.now().copyWith(
      minute: minute, hour: hour, second: 0, millisecond: 0, microsecond: 0);

  if (timeAsString.contains("PM") && hour != 12) {
    dateTime = dateTime.add(const Duration(hours: 12));
  }

  String formattedDate = DateFormat('yyyy-MM-dd kk:mm:ss').format(dateTime);
  return formattedDate;
}

String parseTimeOfDay(TimeOfDay? timeOfDay) {
  if (timeOfDay == null) return "Select time here";

  var minute = (timeOfDay.minute % 60).toString().padLeft(2, '0');
  var hour = (timeOfDay.hour % 60).toString().padLeft(2, '0');
  return "$hour:$minute";
}
