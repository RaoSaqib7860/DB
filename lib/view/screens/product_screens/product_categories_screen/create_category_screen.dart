import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../product_screen.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  bool _value = false;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7.h,
              width: 100.w,
              color: blueColor,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 2.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 30.w,),
                    Text(
                      'Product Category',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLineTextField(name: 'Name', hint: 'Cabnet',),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Parent Category',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Container(
                      height: 4.h,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff4C4C4C),size: 3.h,),
                        underline: Container(color: Colors.grey,height: 0.10.h,width: 100.w,),
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(fontSize: 10.sp,color: Color(0xff8E8E8E)),),
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
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Featured',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Container(
                      height: 4.h,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff4C4C4C),size: 3.h,),
                        underline: Container(color: Colors.grey,height: 0.10.h,width: 100.w,),
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(fontSize: 10.sp,color: Color(0xff8E8E8E)),),
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
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Assign To Menu',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Container(
                      height: 4.h,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff4C4C4C),size: 3.h,),
                        underline: Container(color: Colors.grey,height: 0.10.h,width: 100.w,),
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(fontSize: 10.sp,color: Color(0xff8E8E8E)),),
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
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Assign Top Header Menu',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Container(
                      height: 4.h,
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff4C4C4C),size: 3.h,),
                        underline: Container(color: Colors.grey,height: 0.10.h,width: 100.w,),
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(fontSize: 10.sp,color: Color(0xff8E8E8E)),),
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
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Thumbnail',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w,right: 4.w),
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
                    padding: EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 19.h,),
                  GestureDetector(
                    onTap: () {
                      //Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w,right: 4.w),
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                             color: Colors.white,
                             fontSize: 12.sp,
                             fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
