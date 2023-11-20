import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData(
                  timePickerTheme: TimePickerTheme.of(context).copyWith(
                    backgroundColor: Colors.green.shade100,
                    dialHandColor: Colors.green,
                  ),
                ),
                child: MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child ?? const SizedBox(),
                ),
              );
            },
          );
        },
        child: const Text(
          "SetTime",
          textAlign: TextAlign.start,
        ));
  }
}
