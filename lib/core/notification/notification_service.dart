import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/features/notification/domain/enitities/notification_item.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:medicine_tracker/utils/time_parser.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

const AndroidNotificationChannel _androidChannel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
  showBadge: true,
);

final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

int id = 0;
final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();
const String navigationActionId = 'id_3';
final StreamController<NotificationItem> didReceiveLocalNotificationStream =
    StreamController<NotificationItem>.broadcast();

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

@lazySingleton
class NotificationService {
  Future initialise() async {
    await _localNotificationSetup();
  }

  Future<void> _localNotificationSetup() async {
    await _configureLocalTimeZone();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    didReceiveLocalNotificationStream.add(
      NotificationItem(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'high_importance_channel', 'High Importance Notifications',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        id++, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  Future<void> scheduleNotification(
      {required String medicineName, required String time}) async {
    print(_nextInstanceOfTime(time).toString() + " :normal notification");
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'high_importance_channel', 'High Importance Notifications',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id++,
        'Medicine Time',
        "Take your medicine now. It's time for taking $medicineName",
        _nextInstanceOfTime(time),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> scheduleDailyNotification(
      {required String medicineName, required String time}) async {
    print(_nextInstanceOfTime(time).toString() + " daily notification.");
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Medicine Time',
        "Take your medicine now. It's time for taking $medicineName daily",
        _nextInstanceOfTime(time),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTime(String time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime.parse(tz.local, to24hourTime(time));

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
