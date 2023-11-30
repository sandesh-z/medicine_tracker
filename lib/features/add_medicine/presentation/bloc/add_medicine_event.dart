part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineEvent with _$AddMedicineEvent {
  const factory AddMedicineEvent.save(MedicineDetails medicineDetails) =
      _SaveMedicineDetail;
  const factory AddMedicineEvent.update(int id, String value) =
      _UpdateMedicineDetail;
  const factory AddMedicineEvent.getAllMedicine() = _GetAllMedicine;
  const factory AddMedicineEvent.changeMedicineTimeFrequency(
      int medicineFrequency) = _ChangeMedicineTimeFrequency;
}
