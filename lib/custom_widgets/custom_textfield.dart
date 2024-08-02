import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  String? hintText;
  bool? obsecureText = false;
  bool? filled = false;
  Color? fillColor;
   CustomTextField({Key? key,this.hintText,this.controller,this.obsecureText,this.fillColor,this.filled}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.5.h,
      child: TextField(
        style: TextStyle(fontSize: 12.sp),
        controller: widget.controller,
        obscureText: widget.obsecureText !=null ? widget.obsecureText! : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: widget.hintText,
          filled: widget.filled !=null ?widget.filled : false,
          fillColor: widget.fillColor != null ? widget.fillColor : null,
          hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
        ),
      ),
    );
  }
}
