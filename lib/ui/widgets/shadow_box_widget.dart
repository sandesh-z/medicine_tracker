import 'package:flutter/material.dart';

class ShadowBoxWidget extends StatelessWidget {
  final GestureTapCallback? ontap;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? color;

  const ShadowBoxWidget({
    super.key,
    required this.child,
    this.margin,
    this.ontap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 12,
    ),
    this.color,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Color(0xff009E60),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
