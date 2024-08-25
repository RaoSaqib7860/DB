import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomLineTextField extends StatefulWidget {
  String? hint;
  String? name;
  bool? readOnly;
  bool? enable;
  Function()? onClick;
  TextEditingController? controller;
  Function(String)? onChanged;
  CustomLineTextField(
      {Key? key,
      this.controller,
      this.onClick,
      this.name,
      this.hint,
      this.readOnly = false,
      this.onChanged,
      this.enable = true})
      : super(key: key);

  @override
  State<CustomLineTextField> createState() => _CustomLineTextFieldState();
}

class _CustomLineTextFieldState extends State<CustomLineTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Row(
            children: [
              Text(
                widget.name!.tr,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            ],
          ),
        ),
        //SizedBox(height: 0.3.h,),
        Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Container(
            height: 3.h,
            //width: 90.w,
            child: TextFormField(
              onTap: widget.onClick,
              readOnly: widget.readOnly!,
              enabled: widget.enable,
              controller: widget.controller,
              onChanged: widget.onChanged,
              style: TextStyle(fontSize: 10.sp, color: Colors.black),
              decoration: InputDecoration(
                  hintText: widget.hint!.tr,
                  hintStyle: TextStyle(fontSize: 9.sp),
                  contentPadding: EdgeInsets.only(bottom: 1.6.h)),
            ),
          ),
        ),
        SizedBox(
          height: 2.5.h,
        ),
      ],
    );
  }
}
