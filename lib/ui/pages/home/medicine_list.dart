import 'package:flutter/material.dart';
import 'package:medicine_tracker/features/add_medicine/domain/enitities/medicine_details.dart';
import 'package:medicine_tracker/ui/pages/home/medicine_detail_tile.dart';

class MedicineList extends StatelessWidget {
  final List<MedicineDetails> list;

  const MedicineList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(children: [...list.map((e) => MedicineDetailTile(item: e))]);
  }
}
