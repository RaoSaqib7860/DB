import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomToast extends StatefulWidget {
  final Widget? message;
  double? height;
  double? width;
  CustomToast({Key? key,this.message, this.height, this.width}) : super(key: key);

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withAlpha(80),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            width: widget.width,
            height: widget.height,
            // padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: widget.message,
          ),
        ),
      ),
    );
  }
}

class CustomToastManager {
  static void showToast({BuildContext? context, Widget? message, double? height, double? width}) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        right: 0,
        child: CustomToast(message: message,width: width, height: height),
      ),
    );

    Overlay.of(context!).insert(overlayEntry);

    // Remove the toast after a certain duration
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
