class MedicineDetails {
  final int? id;
  final String medicineName;
  final int frequency;
  final String schedule;
  MedicineDetails({
    this.id,
    required this.medicineName,
    required this.frequency,
    required this.schedule,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicine_name': medicineName,
      'frequency': frequency,
      'schedule': schedule,
    };
  }

  @override
  String toString() =>
      'MedicineDetails(medicineName: $medicineName, frequency: $frequency, schedule: $schedule)';
}
