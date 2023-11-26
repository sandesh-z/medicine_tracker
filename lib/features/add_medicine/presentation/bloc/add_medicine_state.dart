part of 'add_medicine_bloc.dart';

@freezed
class AddMedicineState with _$AddMedicineState {
  const factory AddMedicineState(
      {required Key key,
      required bool isLoading,
      required int medicineFrequency,
      required List<MedicineDetails>? allMedicineList,
      required List<String> schedules}) = _AddMedicineState;

  factory AddMedicineState.initial() => AddMedicineState(
      isLoading: false,
      key: UniqueKey(),
      medicineFrequency: 1,
      allMedicineList: [],
      schedules: []);
}
