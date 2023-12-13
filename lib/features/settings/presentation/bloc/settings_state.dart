part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool isLoading,
    required bool switchState,
    required int validDiff,
    required Settings settings,
    required ValidTime validTime,
  }) = _SettingsState;

  factory SettingsState.initial() => SettingsState(
      isLoading: false,
      switchState: false,
      validDiff: 5,
      validTime: ValidTime.five,
      settings: Settings(switchLanguageState: false, validDiff: 5));
}
