import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/features/add_medicine/data/data_sources/add_medicine_local_data_source.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/repositories/medicine_details_repository.dart';

@Singleton(as: MedicineDetailsRepository)
class MedicineDetailsRepositoryImpl implements MedicineDetailsRepository {
  final AddMedicineLocalDataSource medicineLocalDataSource;

  MedicineDetailsRepositoryImpl({required this.medicineLocalDataSource});
  @override
  Future saveMedicineDetail({required MedicineDetails medicineDetails}) async {
    await medicineLocalDataSource.saveMedicineDetailItem(medicineDetails);
  }

  @override
  Future getAllMedicine() {
    // TODO: implement getAllMedicine
    throw UnimplementedError();
  }
}
