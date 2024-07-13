import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void customBottomSheet({BuildContext? context, Widget? widget}){
  showModalBottomSheet(
    context: context!,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

    ),
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Container(
                // height: 33.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: widget,
                ),
              ),
            ),
          );
        },
      );
    },
  );
}