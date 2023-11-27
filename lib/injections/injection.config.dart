// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/database/local_database_provider.dart' as _i4;
import '../core/database/medicine_detail_provider.dart' as _i5;
import '../core/notification/notification_service.dart' as _i6;
import '../features/add_medicine/data/data_sources/add_medicine_local_data_source.dart'
    as _i8;
import '../features/add_medicine/data/repositories/medicine_details_repository.dart'
    as _i10;
import '../features/add_medicine/domain/repositories/medicine_details_repository.dart'
    as _i9;
import '../features/add_medicine/domain/usecases/get_medicine_details.dart'
    as _i11;
import '../features/add_medicine/presentation/bloc/add_medicine_bloc.dart'
    as _i12;
import '../features/localization_cubit/app_localization_cubit.dart' as _i3;
import 'injectable/shared_preference_module.dart' as _i13;

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
    gh.lazySingleton<_i3.AppLocalizationCubit>(
        () => _i3.AppLocalizationCubit());
    gh.singleton<_i4.DBProvider>(_i4.DBProviderImpl());
    gh.singleton<_i5.MedicineDetailsProvider>(
        _i5.MedicineProviderImpl(provider: gh<_i4.DBProvider>()));
    gh.lazySingleton<_i6.NotificationService>(() => _i6.NotificationService());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.AddMedicineLocalDataSource>(() =>
        _i8.AddMedicineDabasaseImpl(
            medicineDetailsProvider: gh<_i5.MedicineDetailsProvider>()));
    gh.singleton<_i9.MedicineDetailsRepository>(
        _i10.MedicineDetailsRepositoryImpl(
            medicineLocalDataSource: gh<_i8.AddMedicineLocalDataSource>()));
    gh.lazySingleton<_i11.GetMedicineDetails>(() => _i11.GetMedicineDetails(
        repository: gh<_i9.MedicineDetailsRepository>()));
    gh.lazySingleton<_i12.AddMedicineBloc>(
        () => _i12.AddMedicineBloc(gh<_i11.GetMedicineDetails>()));
    return this;
  }
}

class _$SharedPreferenceModule extends _i13.SharedPreferenceModule {}
