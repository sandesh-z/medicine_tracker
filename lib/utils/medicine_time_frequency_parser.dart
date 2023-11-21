parseMedicineFrequency(String? name) {
  int medicineFrequency = 1;
  switch (name) {
    case "Once a day":
      medicineFrequency = 1;
      break;
    case "Twice a day":
      medicineFrequency = 2;
      break;
    case "3 times a day":
      medicineFrequency = 3;
      break;
    case "4 times a day":
      medicineFrequency = 4;
      break;
    default:
      medicineFrequency = 1;
  }
  return medicineFrequency;
}
