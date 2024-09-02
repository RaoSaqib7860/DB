import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void customDialogue({BuildContext? context, Widget? title, double? height, Widget? content, double? width}){
  showDialog(
    context: context!,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xfff6f6f6),
        surfaceTintColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        insetPadding:  EdgeInsets.symmetric(horizontal: 0.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: title,
        content: Container(
          height: height,
          width: width != null ? width : 98.w,
          decoration: BoxDecoration(
            color: Color(0xfff6f6f6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: content,
        ),

      );
    },
  );
}