import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String? hintText;
  final TextEditingController? controller;
  final bool? readOnly;
  const TextFieldWithTitle({
    super.key,
    required this.title,
    this.onTap,
    this.readOnly,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(height: 5.h),
        TextField(
          readOnly: readOnly ?? false,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
            hintText: hintText,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
