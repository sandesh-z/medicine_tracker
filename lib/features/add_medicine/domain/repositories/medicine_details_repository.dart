import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class MedicineDetailsRepository {
  Future saveMedicineDetail({required MedicineDetails medicineDetails});
  Future<List<MedicineDetails>?> getAllMedicine();
}
