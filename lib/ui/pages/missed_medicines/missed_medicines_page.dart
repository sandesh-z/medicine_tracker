import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/pages/missed_medicines/missed_medicine_item.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';

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
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryBackground1,
          iconTheme: IconThemeData(color: Palette.white),
          title: Text(
            strings.missed_med_today,
            style: TextStyle(color: Palette.white),
          ),
        ),
        body: BlocBuilder<AddMedicineBloc, AddMedicineState>(
          builder: (context, state) {
            if (state.missedMedicines?.isEmpty ?? true) {
              return Center(
                child: Text(strings.no_missed_med_msg),
              );
            }
            return SingleChildScrollView(
                child: MissedMedicineList(list: state.missedMedicines ?? []));
          },
        ),
      ),
    );
  }
}
