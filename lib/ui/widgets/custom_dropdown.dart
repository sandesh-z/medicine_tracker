import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> itmes;
  final void Function(String?) callback;
  final String initalValue;
  const CustomDropdown(
      {super.key,
      required this.title,
      required this.itmes,
      required this.callback,
      required this.initalValue});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String dropdownvalue = widget.initalValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          isDense: true,
          value: dropdownvalue,
          elevation: 16,
          focusColor: Colors.green,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusColor: Colors.green.shade200,
              contentPadding: EdgeInsets.all(8.r)),
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderRadius.circular(8.r),
          items: widget.itmes.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Row(
                children: [
                  Text(items),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
            widget.callback(dropdownvalue);
          },
        ),
      ],
    );
  }
}
