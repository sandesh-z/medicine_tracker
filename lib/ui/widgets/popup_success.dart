import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpSuccessOverLay extends StatefulWidget {
  final String title;
  final String? message;
  final String? bthTitle;

  final void Function()? onPressed;

  const PopUpSuccessOverLay({
    super.key,
    required this.title,
    this.message,
    this.bthTitle,
    required this.onPressed,
  });
  @override
  State<StatefulWidget> createState() => PopUpSuccessOverLayState();
}

class PopUpSuccessOverLayState extends State<PopUpSuccessOverLay>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(40.0),
          padding: EdgeInsets.only(top: 40.r, bottom: 10.r),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Image(
                image: AssetImage(
                  'assets/images/success.png',
                ),
                height: 80,
                fit: BoxFit.contain,
                // width: 200,
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0.sp,
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
                  widget.message ?? "Thank you!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0.sp,
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
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextButton(
                        onPressed: widget.onPressed,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: Text(
                          widget.bthTitle ?? "Return",
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
