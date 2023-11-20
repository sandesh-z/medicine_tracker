import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/app_constants/constants.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_localization_state.dart';
part 'app_localization_cubit.freezed.dart';

@lazySingleton
class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  final SharedPreferences _preferences;
  AppLocalizationCubit(this._preferences)
      : super(AppLocalizationState.initial(
            _preferences.getBool(AppLocalizationConstants.hasselectedenglish) ??
                false));
  void changeLang(AppLocale locale) {
    if (locale.name == 'English') {
      _preferences.setBool(AppLocalizationConstants.hasselectedenglish, true);
    } else {
      _preferences.setBool(AppLocalizationConstants.hasselectedenglish, false);
    }
    emit(state.copyWith(appLocale: locale, key: UniqueKey()));
  }
}
