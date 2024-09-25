import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class CustomContainer extends StatefulWidget {
  Widget? widgets;
  bool? is_back_btn;
  CustomContainer({Key? key, this.widgets, this.is_back_btn = false})
      : super(key: key);

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
          SizedBox(
            height: 16.h,
            child: widget.is_back_btn!
                ? Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ),
          Expanded(
              child: Container(
            width: 100.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: widget.widgets,
          ))
        ],
      ),
    );
  }
}
