import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/medicine_detail_provider.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class AddMedicineLocalDataSource {
  Future<void> saveMedicineDetailItem(MedicineDetails medicineDetails);
  Future<void> updateMedicineDetailItem(String value, int id);
  Future<void> delete(int id);
  Future<List<MedicineDetails>?> getAllMedicineItems();
}

@LazySingleton(as: AddMedicineLocalDataSource)
class AddMedicineDabasaseImpl implements AddMedicineLocalDataSource {
  final MedicineDetailsProvider medicineDetailsProvider;

  AddMedicineDabasaseImpl({required this.medicineDetailsProvider});
  @override
  Future<void> saveMedicineDetailItem(MedicineDetails medicineDetails) async {
    medicineDetailsProvider.insertMedicineDetailItem(medicineDetails);
  }

  @override
  Future<List<MedicineDetails>?> getAllMedicineItems() async {
    final details = await medicineDetailsProvider.getAllMedicne();
    if (details != null && details.isNotEmpty) {
      return details;
    }
    return [];
  }

  @override
  Future<void> updateMedicineDetailItem(String value, int id) async {
    await medicineDetailsProvider.updateMedicineDetailItem(value, id);
  }

  @override
  Future<void> delete(int id) async {
    await medicineDetailsProvider.delete(id);
  }
}
