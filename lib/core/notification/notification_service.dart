import 'package:injectable/injectable.dart';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:medicine_tracker/main.dart';

@lazySingleton
class NotificationService {
  Future initialize() async {
    await initializeLocalNotifications();
    await initializeIsolateReceivePort();
    // bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    // if (!isAllowed) {
    //   isAllowed = await displayNotificationRationale();
    // }
  }

  static ReceivedAction? initialAction;
  Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'basic_channel',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple)
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  static ReceivePort? receivePort;
  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));

    // This initialization only happens on main isolate
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');
  }

  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    //navigate to antoher page
  }
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      // ignore: avoid_print
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
    } else {
      // this process is only necessary when you need to redirect the user
      // to a new page or use a valid context, since parallel isolates do not
      // have valid context, so you need redirect the execution to main isolate
      if (receivePort == null) {
        // ignore: avoid_print
        print(
            'onActionReceivedMethod was called inside a parallel dart isolate.');
        SendPort? sendPort =
            IsolateNameServer.lookupPortByName('notification_action_port');

        if (sendPort != null) {
          // ignore: avoid_print
          print('Redirecting the execution to main isolate process.');
          sendPort.send(receivedAction);
          return;
        }
      }

      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = appRouter.navigatorKey.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> myNotifyScheduleInHours({
    required DateTime time,
    required String title,
    required String msg,
    bool repeatNotif = false,
  }) async {
    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        hour: time.hour,
        minute: time.minute,
        second: 0,
        repeats: repeatNotif,
        preciseAlarm: true,
        allowWhileIdle: true,
      ),
      content: NotificationContent(
        id: Random().nextInt(100),
        channelKey: 'basic_channel',
        title: '${Emojis.medical_pill} $title',
        body: '  $msg',
        notificationLayout: NotificationLayout.Default,
        color: Colors.black,
        backgroundColor: Colors.black,
        payload: {
          'actPag': 'myAct',
          'actType': 'food',
        },
      ),
    );
  }
}
