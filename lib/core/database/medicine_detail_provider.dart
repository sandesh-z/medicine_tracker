import 'package:injectable/injectable.dart';
import 'package:medicine_tracker/core/database/local_database_provider.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';

abstract class MedicineDetailsProvider {
  Future insertMedicineDetailItem(MedicineDetails medicineDetails);
}

@Singleton(as: MedicineDetailsProvider)
class MedicineProviderImpl implements MedicineDetailsProvider {
  final DBProvider provider;

  MedicineProviderImpl({required this.provider});

  @override
  Future insertMedicineDetailItem(MedicineDetails medicineDetails) async {
    await provider.open();

    await provider.insert(
      tableName: 'medicine_details',
      values: medicineDetails.toMap(),
    );
  }
}
