import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/features/settings/data/data_sources/local_data_source.dart';
import 'package:medicine_tracker/features/settings/data/models/settings.dart';
import 'package:medicine_tracker/features/settings/domain/repositories/settings_repo.dart';

@Singleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepositoryImpl({required this.settingsLocalDataSource});
  @override
  Future<int> getCurrentValidDiff() {
    return settingsLocalDataSource.getCurrentValidDiff();
  }

  @override
  Future<bool> getLanguageSwitchState() {
    return settingsLocalDataSource.getLanguageSwitchState();
  }

  @override
  Future<void> saveLanguageSwitchState(bool state) {
    return settingsLocalDataSource.saveLanguageSwitchState(state);
  }

  @override
  Future<void> saveValidDiff(int diff) {
    return settingsLocalDataSource.saveValidDiff(diff);
  }

  @override
  Future<Settings> getAllSettings() async {
    bool switchLanguageState =
        await settingsLocalDataSource.getLanguageSwitchState();
    int validDiff = await settingsLocalDataSource.getCurrentValidDiff();

    return Settings(
        switchLanguageState: switchLanguageState, validDiff: validDiff);
  }
}
