import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatefulWidget {
  String? name;
  String? hint;
  TextEditingController? controller;
   CustomFormField({Key? key,this.controller,this.name,this.hint}) : super(key: key);

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
          padding: EdgeInsets.symmetric(horizontal:8.w),
          child: Text(
            widget.name!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(170),
                fontSize: 10.sp
            ),
          ),
        ),
        SizedBox(height: 0.2.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:8.w),
          child: Container(
            height: 3.h,
            //width: 90.w,
            child: TextField(
              controller: widget.controller,
              style: TextStyle(fontSize: 10.sp,color: Colors.black),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(fontSize: 10.sp),
                  contentPadding: EdgeInsets.only(bottom: 1.6.h)
              ),
            ),
          ),
        ),
        SizedBox(height: 3.h,)
      ],
    );
  }
}
