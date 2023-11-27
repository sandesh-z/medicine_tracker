import 'package:flutter/material.dart';
import 'package:medicine_tracker/features/notification/domain/enitities/notification_item.dart';

void navigate(BuildContext context, NotificationItem item,
    {Map<String, dynamic>? data}) {
  if (item.type == null) {
    return;
  }
  switch (item.type) {
    case NotificationType.medicine:
      if ((item.id ?? 0) != 0) {
        //route here
      }
      break;

    case NotificationType.advertisement:
      //route here
      break;

    default:
      return;
  }
}
