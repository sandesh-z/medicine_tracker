part of 'app_localization_cubit.dart';

@freezed
class AppLocalizationState with _$AppLocalizationState {
  const factory AppLocalizationState({
    required AppLocale appLocale,
    required Key key,
  }) = _AppLocalizationState;

  factory AppLocalizationState.initial() => AppLocalizationState(
      appLocale: AppLocale.english, //default
      key: UniqueKey());
}
