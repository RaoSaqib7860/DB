import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';

class CreateBrandScreen extends StatefulWidget {
  const CreateBrandScreen({Key? key}) : super(key: key);

  @override
  State<CreateBrandScreen> createState() => _CreateBrandScreenState();
}

class _CreateBrandScreenState extends State<CreateBrandScreen> {
  bool _value = false;
  var items = [
    'No',
    'Yes',
  ];
  String dropdownvalue = 'No';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 7.h,
            width: 100.w,
            color: blueColor,
            child: Center(
              child: Text(
                'Product Category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 3.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w,),
            child: CustomLineTextField(name: 'Brand Name*',hint: 'Lamp',),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w,),
            child: Text(
              'Featured',
              style: TextStyle(color: Colors.black,fontSize: 10.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w,),
            child: DropdownButton(
              isExpanded: true,
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 3.h,),
              underline: Padding(
                padding:  EdgeInsets.only(top: 1.h),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,style: TextStyle(color: Colors.black54,fontSize: 10.sp),),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              hint:  Text(
                "Font Family",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w,),
            child: Text(
              'Thumbnail',
              style: TextStyle(color: Colors.black,fontSize: 10.sp),
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: EdgeInsets.only(left: 6.w,right: 6.w),
            child: Container(
              height: 3.h,
              width: 28.w,
              decoration: BoxDecoration(
                color: Color(0xffF4F4F4),
                border: Border.all(width: 0.7,color: Color(0xff4C4C4C)),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child: Text(
                  'Choose File',
                  style: TextStyle(
                      color: Color(0xff4C4C4C),
                      fontSize: 8.sp
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w,right: 6.w),
            child: Divider(
              thickness: 0.8,
              color: Colors.black,
            ),
          ),
          // Padding(
          //   padding:  EdgeInsets.only(left: 6.w,right: 6.w,top: 1.h),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Container(
          //       height: 3.5.h,
          //       width: 53.w,
          //       decoration: BoxDecoration(
          //         border: Border.all(width: 1,color: Colors.black12),
          //         borderRadius: BorderRadius.circular(3),
          //       ),
          //       child: Padding(
          //         padding:  EdgeInsets.all(3),
          //         child: ToggleSwitch(
          //           // minWidth: 25.w,
          //           customWidths: [20.w, 30.w],
          //           minHeight: 2.h,
          //           fontSize: 8.sp,
          //           initialLabelIndex: 0,
          //           activeBgColor: [Colors.grey.withAlpha(150)],
          //           inactiveBgColor: Colors.white,
          //           cornerRadius: 0,
          //           activeFgColor: Colors.black,
          //           //inactiveFgColor: Colors.grey[900],
          //           totalSwitches: 2,
          //           labels: ['Choose File', 'No file selected',],
          //           onToggle: (index) {
          //             print('switched to: $index');
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w,),
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
