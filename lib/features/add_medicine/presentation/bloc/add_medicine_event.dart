part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineEvent with _$AddMedicineEvent {
  const factory AddMedicineEvent.save(MedicineDetails medicineDetails) =
      _SaveMedicineDetail;
  const factory AddMedicineEvent.changeMedicineTimeFrequency(
      int medicineFrequency) = _ChangeMedicineTimeFrequency;
}
