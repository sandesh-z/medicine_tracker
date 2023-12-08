part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({required bool isEnglish}) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(isEnglish: true);
}
