import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatefulWidget {
  String? name;
  String? hint;
  bool? enable;
  TextEditingController? controller;
  CustomFormField(
      {Key? key, this.controller, this.name, this.hint, this.enable = true})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            widget.name!.tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(170),
                fontSize: 10.sp),
          ),
        ),
        SizedBox(
          height: 0.2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            height: 3.h,
            child: TextField(
              controller: widget.controller,
              enabled: widget.enable,
              style: TextStyle(fontSize: 10.sp, color: Colors.black),
              decoration: InputDecoration(
                  hintText: widget.hint!.tr,
                  hintStyle: TextStyle(fontSize: 10.sp),
                  contentPadding: EdgeInsets.only(bottom: 1.6.h)),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        )
      ],
    );
  }
}
