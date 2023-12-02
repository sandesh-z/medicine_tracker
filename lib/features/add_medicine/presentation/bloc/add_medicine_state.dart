part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineState with _$AddMedicineState {
  const factory AddMedicineState(
      {required Key key,
      required bool isLoading,
      required bool success,
      required int medicineFrequency,
      required List<MedicineDetails>? allMedicineList,
      required List<String> schedules}) = _AddMedicineState;

  factory AddMedicineState.initial() => AddMedicineState(
      isLoading: false,
      success: false,
      key: UniqueKey(),
      medicineFrequency: 1,
      allMedicineList: [],
      schedules: []);
}
