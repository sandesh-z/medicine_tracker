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
  final SharedPreferences _sharedPreferences;

  AppLocalizationCubit(this._sharedPreferences)
      : super(AppLocalizationState.initial(_sharedPreferences
                .getBool(AppLocalizationConstants.hasSelectedEnglish) ??
            false));
  void changeLang(AppLocale locale) {
    if (locale.name == 'English') {
      _sharedPreferences.setBool(
          AppLocalizationConstants.hasSelectedEnglish, true);
    } else {
      _sharedPreferences.setBool(
          AppLocalizationConstants.hasSelectedEnglish, false);
    }
    emit(state.copyWith(appLocale: locale, key: UniqueKey()));
  }
}
