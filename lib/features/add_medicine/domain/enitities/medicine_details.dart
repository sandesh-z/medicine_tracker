class MedicineDetails {
  final int? id;
  final String medicineName;
  final int frequency;
  final String schedule;
  final String? allMedicineTakenList;
  MedicineDetails(
      {this.id,
      required this.medicineName,
      required this.frequency,
      required this.schedule,
      this.allMedicineTakenList});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicine_name': medicineName,
      'frequency': frequency,
      'schedule': schedule,
      'all_medicine_taken': allMedicineTakenList ?? ""
    };
  }

  @override
  String toString() {
    return 'MedicineDetails(id: $id, medicineName: $medicineName, frequency: $frequency, schedule: $schedule, allMedicineTakenList: $allMedicineTakenList)';
  }
}
