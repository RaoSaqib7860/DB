import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class CustomContainer extends StatefulWidget {
  Widget? widgets;
   CustomContainer({Key? key,this.widgets}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: blueColor,
      child: Column(
        children: [
          SizedBox(height: 16.h,),
          Expanded(
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
                ),
                child: widget.widgets,
              )
          )
        ],
      ),
    );
  }
}
