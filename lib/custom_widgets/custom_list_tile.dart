import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTie extends StatefulWidget {
  String? text;
  Widget? widget;
   CustomListTie({Key? key,this.widget,this.text}) : super(key: key);

  @override
  State<CustomListTie> createState() => _CustomListTieState();
}

class _CustomListTieState extends State<CustomListTie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text!,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Color(0xff535353)
              ),
            ),
            widget.widget!
          ],
        ),
        SizedBox(height: 0.2.h,),
        Container(
          height: 0.1.h,
          color: Color(0xff707070),
        ),
        SizedBox(height:1.5.h)
      ],
    );
  }
}
