import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<int> getCurrentValidDiff();
  Future<void> saveValidDiff(int diff);
  Future<void> saveLanguageSwitchState(bool state);
  Future<bool> getLanguageSwitchState();
}

@Singleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<int> getCurrentValidDiff() async {
    int diff = sharedPreferences.getInt(AppConstants.markingDurationKey) ?? 5;
    return diff;
  }

  @override
  Future<bool> getLanguageSwitchState() async {
    bool switchLanguageState =
        sharedPreferences.getBool(AppConstants.switchState) ?? false;
    return switchLanguageState;
  }

  @override
  Future<void> saveLanguageSwitchState(bool state) {
    return sharedPreferences.setBool(AppConstants.switchState, state);
  }

  @override
  Future<void> saveValidDiff(int diff) {
    return sharedPreferences.setInt(AppConstants.markingDurationKey, diff);
  }
}
