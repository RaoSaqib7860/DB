
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';

class InventoryScreen extends StatefulWidget {
  final int? index;
  const InventoryScreen({this.index,Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  TextEditingController nameController = TextEditingController();
  var items = [
    'Don\'t need to manage stock',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Don\'t need to manage stock';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Stock',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: CustomLineTextField(name: 'SKU',hint: '#ABC-123',controller: nameController),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Manage Stock',
                  style: TextStyle(color: Colors.black,fontSize: 10.sp),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down_outlined,size: 3.h,color: Colors.black,),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: TextStyle(color: Colors.grey,fontSize: 11.sp),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                  hint:  Text(
                    "Font Family",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Stock Status',
                  style: TextStyle(color: Colors.black,fontSize: 10.sp),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down_outlined,size: 3.h,color: Colors.black,),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: TextStyle(color: Colors.grey,fontSize: 11.sp),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                  hint:  Text(
                    "Font Family",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name / Variant',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp
                                  ),
                                ),
                                Text(
                                  'Images',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp
                                  ),
                                ),
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: Color(0xffEFEFEF),
                            borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w, right: 6.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Blue S',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 6.w),
                                    child: Container(
                                      height: 5.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(width: 1,color: Color(0xff707070))
                                      ),
                                      child: Center(
                                        child: Icon(Icons.image,color: Colors.blue,size: 3.h,),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '37',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w, right: 6.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Red L',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w),
                                    child: Container(
                                      height: 5.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(width: 1,color: Color(0xff707070))
                                      ),
                                      child: Center(
                                        child: Icon(Icons.image,color: Colors.blue,size: 3.h,),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '100',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w, right: 6.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Blue M',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 6.w),
                                    child: Container(
                                      height: 5.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(width: 1,color: Color(0xff707070))
                                      ),
                                      child: Center(
                                        child: Icon(Icons.image,color: Colors.blue,size: 3.h,),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        color: Color(0xff454545),
                                        fontSize: 13.sp
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        CustomToastManager.showToast(
                            context: context,
                            height: 8.h,
                            width: 60.w,
                            message: Center(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  children: [
                                    SizedBox(width: 5.w,),
                                    SvgPicture.asset('assets/svgs/pro_toast.svg',height: 3.h,),
                                    SizedBox(width: 5.w,),
                                    Text(
                                      'Changes saved\nsuccessfully',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.black,
                                          height: 0.16.h,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                        Get.offAll(BottomSheetScreen(index: 2,));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.7.w,vertical: 0.8.h),
                          child: Text(
                            'Save Changes',
                            style: TextStyle(color: Colors.white,fontSize: 10.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w,),
                    Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 0.8.h),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white,fontSize: 10.sp),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
