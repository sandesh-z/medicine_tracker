import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';

part 'add_medicine_bloc.freezed.dart';
part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

@lazySingleton
class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final GetMedicineDetails getMedicineDetails;
  AddMedicineBloc(this.getMedicineDetails) : super(AddMedicineState.initial()) {
    on<_SaveMedicineDetail>(_onSaveMedicineDetail);
    on<_ChangeMedicineTimeFrequency>(_onChangeMedicineTimeFrequency);
  }
  _onSaveMedicineDetail(
      _SaveMedicineDetail event, Emitter<AddMedicineState> emit) {
    getMedicineDetails.saveMedicineDetails(item: event.medicineDetails);
  }

  _onChangeMedicineTimeFrequency(
      _ChangeMedicineTimeFrequency event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(medicineFrequency: event.medicineFrequency));
  }
}
