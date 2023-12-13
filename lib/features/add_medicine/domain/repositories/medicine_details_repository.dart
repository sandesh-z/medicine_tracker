import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class MedicineDetailsRepository {
  Future<void> saveMedicineDetail({required MedicineDetails medicineDetails});
  Future<void> updateMedicineDetail({required String value, required int id});
  Future<void> delete({required int id});

  Future<List<MedicineDetails>?> getAllMedicine();
}
