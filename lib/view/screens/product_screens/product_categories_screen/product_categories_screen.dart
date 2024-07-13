import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import 'create_category_screen.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ProductCategoriesScreen> createState() => _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  bool _value = false;
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 3.5.h,
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey,width: 1)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 3.h,
                      width: 33.w,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 2.w,right: 1.w),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.h,color: Colors.black,),
                            value: dropdownvalue,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items,style: TextStyle(fontSize: 9.sp,color: Colors.black),),
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
                    ),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight:  Radius.circular(6)),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 9.sp,color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCategoryScreen(),));
                },
                child: Container(
                  height: 3.5.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Create Category',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 2.h,),
          Expanded(
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(bottom: 12.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                              ]
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 9.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.grey),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Icon(Icons.image,color: blueColor,size: 6.h,),
                                      ),
                                    ),
                                    SizedBox(width: 2.w,),
                                    Expanded(
                                      child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cabnet',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Color(0xff3E3E3E),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 1.h,),
                                          Text(
                                            '/category/cabnet/1221',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Color(0xff3E3E3E),
                                              overflow: TextOverflow.ellipsis,
                                              decoration: TextDecoration.underline
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.5.h,),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                ),
                                SizedBox(height: 0.5.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCategoryScreen(),));
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/svgs/action.svg',height: 2.7.h,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            'Action',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Featured:',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 1.w,),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.4.h),
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9.sp
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Created at',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color(0xff0B7A3E),
                                              fontSize: 9.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 0.3.h,),
                                        Text(
                                          '1 month ago',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff636363),
                                            fontSize: 8.5.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,)
                      ],
                    ),
                  );
                },))
        ],
      ),
    );
  }
}
