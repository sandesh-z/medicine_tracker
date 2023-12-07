import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/localization/app_locale.dart';

part 'app_localization_state.dart';
part 'app_localization_cubit.freezed.dart';

@lazySingleton
class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  AppLocalizationCubit() : super(AppLocalizationState.initial());
  void changeLang(AppLocale locale) {
    emit(state.copyWith(appLocale: locale, key: UniqueKey()));
  }
}
