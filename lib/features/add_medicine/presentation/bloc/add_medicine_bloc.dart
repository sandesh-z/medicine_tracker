import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/notification/notification_service.dart';
import 'package:medicine_tracker/core/usecase/usecase.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';
import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/utils/time_difference_checker.dart';
import 'package:medicine_tracker/utils/time_parser.dart';

part 'add_medicine_bloc.freezed.dart';
part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

@lazySingleton
class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final GetMedicineDetails getMedicineDetails;
  AddMedicineBloc(this.getMedicineDetails) : super(AddMedicineState.initial()) {
    on<_SaveMedicineDetail>(_onSaveMedicineDetail);
    on<_ChangeMedicineTimeFrequency>(_onChangeMedicineTimeFrequency);
    on<_GetAllMedicine>(_onGetAllMedicine);
    on<_UpdateMedicineDetail>(_onUpdateMedicineDetail);
    on<_GetMissedMedicines>(_onGetMissedMedicines);
    on<_DeleteMedicineDetail>(_onDeleteMedicineDetail);
  }
  _onSaveMedicineDetail(
      _SaveMedicineDetail event, Emitter<AddMedicineState> emit) async {
    emit(state.copyWith(isLoading: true));
    var list = event.medicineDetails.schedule.split(',');
    list.removeWhere((element) => element == '');
    for (int i = 0; i < list.length; i++) {
      await getIt<NotificationService>().myNotifyScheduleInHours(
          time: DateTime.parse(to24hourTime(list[i])),
          title: "Medicine Time",
          msg: "It's time for taking ${event.medicineDetails.medicineName}",
          id: event.medicineDetails.id ?? 0,
          repeatNotif: true);
    }

    await getMedicineDetails.saveMedicineDetails(item: event.medicineDetails);
    emit(state.copyWith(isLoading: false, success: true));
  }

  _onChangeMedicineTimeFrequency(
      _ChangeMedicineTimeFrequency event, Emitter<AddMedicineState> emit) {
    emit(state.copyWith(medicineFrequency: event.medicineFrequency));
  }

  _onGetAllMedicine(
      _GetAllMedicine event, Emitter<AddMedicineState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await getMedicineDetails.call(NoParams());
    emit(result.fold(
        (l) => state.copyWith(success: true, isLoading: false),
        (r) => state.copyWith(
            allMedicineList: r, success: true, isLoading: false)));
  }

  _onUpdateMedicineDetail(
      _UpdateMedicineDetail event, Emitter<AddMedicineState> emit) async {
    await getMedicineDetails.updateMedineDetail(
        value: event.value, id: event.id);
  }

  _onDeleteMedicineDetail(
      _DeleteMedicineDetail event, Emitter<AddMedicineState> emit) async {
    try {
      await getMedicineDetails.delete(id: event.id);
      getIt<NotificationService>().cancelNotifications(id: event.id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _onGetMissedMedicines(
      _GetMissedMedicines event, Emitter<AddMedicineState> emit) async {
    final result = await getMedicineDetails.call(NoParams());
    final validDff = await getIt<SettingsCubit>().getCurrentDiff();
    List<MedicineDetails> missedMedicines = [];
    emit(result.fold((l) => state.copyWith(), (allMedicineList) {
      if (allMedicineList?.isEmpty ?? true) {
        return state.copyWith();
      }
      int len = allMedicineList?.length ?? 0;

      for (int i = 0; i < len; i++) {
        if ((allMedicineList![i].allMedicineTakenList?.contains('false') ??
                true) ||
            allMedicineList[i].allMedicineTakenList!.trim().isEmpty) {
          List<String> schedules =
              allMedicineList[i].schedule.split(',').toList();
          schedules.removeWhere((e) => e.trim().isEmpty);

          List<String> flags =
              (allMedicineList[i].allMedicineTakenList?.trim().isEmpty ?? false)
                  ? []
                  : allMedicineList[i]
                          .allMedicineTakenList
                          ?.split(',')
                          .toList() ??
                      [];

          if (isAnyScheduleMissed(schedules, flags, validDff)) {
            missedMedicines.add(allMedicineList[i]);
          }
        }
      }
      return state.copyWith(missedMedicines: missedMedicines);
    }));
  }
}
