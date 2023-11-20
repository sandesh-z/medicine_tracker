part of 'app_localization_cubit.dart';

@freezed
class AppLocalizationState with _$AppLocalizationState {
  const factory AppLocalizationState({
    required AppLocale appLocale,
    required Key key,
  }) = _AppLocalizationState;

  factory AppLocalizationState.initial(bool isEnglish) => AppLocalizationState(
      appLocale: isEnglish ? AppLocale.english : AppLocale.nepalese, //default
      key: UniqueKey());
}
