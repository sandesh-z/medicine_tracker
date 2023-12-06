import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/local_database_provider.dart';

@lazySingleton
class ScheduleTask {
  static final DBProviderImpl _dbProviderImpl = DBProviderImpl();

  int helloAlarmID = 0;
  Future<void> initPeriodicTask() async {
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(
      const Duration(hours: 24), //Do the same every 24 hours
      helloAlarmID++, //Different ID for each alarm
      resetAllMedicineFlags,
      wakeup: true,
      exact: true,
      allowWhileIdle: true, //the device will be woken up when the alarm fires
      startAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1, 1),
      rescheduleOnReboot: true, //Work after reboot
    );
  }

  @pragma('vm:entry-point')
  static void resetAllMedicineFlags() async {
    await _dbProviderImpl.resetAllMedicineTakenFlags();
  }
}
