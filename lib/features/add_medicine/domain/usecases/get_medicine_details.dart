import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/repositories/medicine_details_repository.dart';

import '../../../../core/failures/api_failure.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetMedicineDetails
    implements Usecase<ApiFailure, List<MedicineDetails>, NoParams> {
  final MedicineDetailsRepository repository;

  GetMedicineDetails({
    required this.repository,
  });

  @override
  Future<Either<ApiFailure, List<MedicineDetails>>> call(
      NoParams params) async {
    return Right(await repository.getAllMedicine());
  }

  Future saveMedicineDetails({
    required MedicineDetails item,
  }) {
    return repository.saveMedicineDetail(medicineDetails: item);
  }

  Future getAllMedicine() {
    return repository.getAllMedicine();
  }
}
