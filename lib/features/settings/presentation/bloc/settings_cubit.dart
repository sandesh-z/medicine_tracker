import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/usecase/usecase.dart';
import 'package:medicine_tracker/features/settings/data/models/settings.dart';
import 'package:medicine_tracker/features/settings/domain/usecases/get_settings.dart';
part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

enum ValidTime { five, ten, fifteen }

@lazySingleton
class SettingsCubit extends Cubit<SettingsState> {
  final GetAllSettings getAllSettings;
  SettingsCubit(this.getAllSettings) : super(SettingsState.initial()) {
    getSettings();
    setRadioValues();
  }

  getSettings() async {
    final result = await getAllSettings.call(NoParams());
    emit(result.fold(
        (l) => state.copyWith(),
        (r) => state.copyWith(
            settings: r,
            validDiff: r.validDiff,
            switchState: r.switchLanguageState)));
  }

  Future<void> saveCurrentDiff(int diff) async {
    await getAllSettings.settingsRepository.saveValidDiff(diff);
    emit(state.copyWith(validTime: getRadioValues(diff)));
  }

  Future<int> getCurrentDiff() {
    return getAllSettings.settingsRepository.getCurrentValidDiff();
  }

  saveSwitchState(bool stateValue) {
    getAllSettings.settingsRepository.saveLanguageSwitchState(stateValue);
    emit(state.copyWith(switchState: stateValue));
  }

  Future<bool> getSwitchState() {
    return getAllSettings.settingsRepository.getLanguageSwitchState();
  }

  setRadioValues() async {
    int time = await getAllSettings.settingsRepository.getCurrentValidDiff();
    switch (time) {
      case 10:
        emit(state.copyWith(validTime: ValidTime.ten));
        break;
      case 15:
        emit(state.copyWith(validTime: ValidTime.fifteen));
        break;
      default:
        emit(state.copyWith(validTime: ValidTime.five));
    }
  }

  getRadioValues(int diff) {
    final difference = switch (diff) {
      10 => ValidTime.ten,
      15 => ValidTime.fifteen,
      _ => ValidTime.five,
    };
    return difference;
  }
}
