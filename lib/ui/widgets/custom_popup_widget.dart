import 'package:flutter/material.dart';
import 'package:medicine_tracker/core/localization/strings.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final String title;
  final IconData icon;

  final Function()? onAction;
  final String actionText;
  final String? dismissText;
  final bool showDismiss;

  const CustomDialog(
      {super.key,
      required this.message,
      required this.title,
      this.onAction,
      this.showDismiss = false,
      this.dismissText,
      this.actionText = '',
      this.icon = Icons.info_outline_rounded});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(40.0),
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 80, color: Colors.black26),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Palette.primaryBackground4,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (showDismiss)
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: Text(
                            dismissText ?? strings.cancel,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (onAction != null)
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: TextButton(
                          onPressed: onAction,
                          style: TextButton.styleFrom(
                            backgroundColor: Palette.primaryBackground1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: Text(
                            actionText,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
