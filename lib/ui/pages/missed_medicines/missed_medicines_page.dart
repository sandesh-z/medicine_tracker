import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/ui/pages/missed_medicines/missed_medicine_item.dart';

@RoutePage()
class MissedMedicinePage extends StatefulWidget {
  const MissedMedicinePage({super.key});

  @override
  State<MissedMedicinePage> createState() => _MissedMedicinePageState();
}

class _MissedMedicinePageState extends State<MissedMedicinePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<AddMedicineBloc>()
        .add(const AddMedicineEvent.getMissedMedicines());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text('Missed medicines today'),
      ),
      body: BlocBuilder<AddMedicineBloc, AddMedicineState>(
        builder: (context, state) {
          if (state.missedMedicines?.isEmpty ?? true) {
            return const Center(
              child: Text("Congratulations!! No medicine missed today."),
            );
          }
          return SingleChildScrollView(
              child: MissedMedicineList(list: state.missedMedicines ?? []));
        },
      ),
    );
  }
}