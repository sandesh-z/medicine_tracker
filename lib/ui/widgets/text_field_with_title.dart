import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  const TextFieldWithTitle({
    super.key,
    required this.title,
    this.onTap,
    this.readOnly,
    this.hintText,
    this.controller,
    this.validator,
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
        TextFormField(
          readOnly: readOnly ?? false,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
              hintText: hintText,
              contentPadding: EdgeInsets.all(12.r)),
          onTap: onTap,
        ),
      ],
    );
  }
}
