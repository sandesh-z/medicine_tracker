import 'package:medicine_tracker/features/settings/data/models/settings.dart';

abstract class SettingsRepository {
  Future<int> getCurrentValidDiff();
  Future<void> saveValidDiff(int diff);
  Future<void> saveLanguageSwitchState(bool state);
  Future<bool> getLanguageSwitchState();
  Future<Settings> getAllSettings();
}
