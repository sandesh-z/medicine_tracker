// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../features/localization_cubit/app_localization_cubit.dart' as _i4;
import 'injectable/shared_preference_module.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferenceModule = _$SharedPreferenceModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.AppLocalizationCubit>(
        () => _i4.AppLocalizationCubit(gh<_i3.SharedPreferences>()));
    return this;
  }
}

class _$SharedPreferenceModule extends _i5.SharedPreferenceModule {}
