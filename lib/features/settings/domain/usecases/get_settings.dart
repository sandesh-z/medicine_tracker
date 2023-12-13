import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/failures/api_failure.dart';
import 'package:medicine_tracker/core/usecase/usecase.dart';
import 'package:medicine_tracker/features/settings/data/models/settings.dart';
import 'package:medicine_tracker/features/settings/domain/repositories/settings_repo.dart';

@lazySingleton
class GetAllSettings implements Usecase<ApiFailure, Settings, NoParams> {
  final SettingsRepository settingsRepository;

  GetAllSettings({required this.settingsRepository});

  @override
  Future<Either<ApiFailure, Settings>> call(NoParams params) async {
    return Right(await settingsRepository.getAllSettings());
  }
}
