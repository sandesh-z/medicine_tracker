import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@lazySingleton
class SettingsCubit extends Cubit<SettingsState> {
  final SharedPreferences _sharedPreferences;

  SettingsCubit(this._sharedPreferences) : super(SettingsState.initial()) {
    setDefaultLanguage();
  }

  setDefaultLanguage() {
    bool isEnglish = _sharedPreferences
            .getBool(AppLocalizationConstants.hasSelectedEnglish) ??
        true;
    emit(state.copyWith(isEnglish: isEnglish));
  }

  changeLanguageKey(bool isEnglish) {
    emit(state.copyWith(isEnglish: isEnglish));
  }
}
