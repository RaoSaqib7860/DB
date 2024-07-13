import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';

class CreateAttributeTwoScreen extends StatefulWidget {
  const CreateAttributeTwoScreen({Key? key}) : super(key: key);

  @override
  State<CreateAttributeTwoScreen> createState() => _CreateAttributeTwoScreenState();
}

class _CreateAttributeTwoScreenState extends State<CreateAttributeTwoScreen> {
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
                'Create Attribute',
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
            child: CustomLineTextField(name: 'Name',hint: 'Lamp',),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w,),
            child: Text(
              'Select Attribute',
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
