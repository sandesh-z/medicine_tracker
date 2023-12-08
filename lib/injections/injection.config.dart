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

import '../core/database/local_database_provider.dart' as _i3;
import '../core/database/medicine_detail_provider.dart' as _i4;
import '../core/notification/notification_service.dart' as _i5;
import '../features/add_medicine/data/data_sources/add_medicine_local_data_source.dart'
    as _i8;
import '../features/add_medicine/data/repositories/medicine_details_repository.dart'
    as _i11;
import '../features/add_medicine/domain/repositories/medicine_details_repository.dart'
    as _i10;
import '../features/add_medicine/domain/usecases/get_medicine_details.dart'
    as _i12;
import '../features/add_medicine/presentation/bloc/add_medicine_bloc.dart'
    as _i13;
import '../features/localization_cubit/app_localization_cubit.dart' as _i9;
import '../utils/schedule_task.dart' as _i6;
import 'injectable/shared_preference_module.dart' as _i14;

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
    gh.singleton<_i3.DBProvider>(_i3.DBProviderImpl());
    gh.singleton<_i4.MedicineDetailsProvider>(
        _i4.MedicineProviderImpl(provider: gh<_i3.DBProvider>()));
    gh.lazySingleton<_i5.NotificationService>(() => _i5.NotificationService());
    gh.lazySingleton<_i6.ScheduleTask>(() => _i6.ScheduleTask());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.AddMedicineLocalDataSource>(() =>
        _i8.AddMedicineDabasaseImpl(
            medicineDetailsProvider: gh<_i4.MedicineDetailsProvider>()));
    gh.lazySingleton<_i9.AppLocalizationCubit>(
        () => _i9.AppLocalizationCubit(gh<_i7.SharedPreferences>()));
    gh.singleton<_i10.MedicineDetailsRepository>(
        _i11.MedicineDetailsRepositoryImpl(
            medicineLocalDataSource: gh<_i8.AddMedicineLocalDataSource>()));
    gh.lazySingleton<_i12.GetMedicineDetails>(() => _i12.GetMedicineDetails(
        repository: gh<_i10.MedicineDetailsRepository>()));
    gh.lazySingleton<_i13.AddMedicineBloc>(
        () => _i13.AddMedicineBloc(gh<_i12.GetMedicineDetails>()));
    return this;
  }
}

class _$SharedPreferenceModule extends _i14.SharedPreferenceModule {}
