import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/custom_toast.dart';

class VariantScreen extends StatefulWidget {
  final int? index;
  const VariantScreen({this.index,Key? key}) : super(key: key);

  @override
  State<VariantScreen> createState() => _VariantScreenState();
}

class _VariantScreenState extends State<VariantScreen> with TickerProviderStateMixin {
  late TabController _controller;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 0.7.h),
                        child: Text(
                          'Create Variants',
                          style: TextStyle(color: Colors.white,fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 4.h,
                  color: redColor,
                  child: TabBar(
                    controller: _controller,
                    indicatorWeight: 0.00001,
                    tabs: [
                      Text(
                        'ATTRIBUTES',
                        style: TextStyle(fontSize: 10.sp,color: Colors.white),
                      ),
                      Text(
                        'VALUES',
                        style: TextStyle(fontSize: 10.sp,color: Colors.white),
                      ),
                      Text(
                        'TRASH',
                        style: TextStyle(fontSize: 10.sp,color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(spreadRadius: 1,color: Colors.black12,offset: Offset(1, 1)),
                      BoxShadow(spreadRadius: 1,color: Colors.black12,offset: Offset(-1, -1)),
                    ],
                  ),
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 1.w),
                          child: Row(
                            children: [
                              Container(
                                height: 3.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black12,width: 1)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                  child: DropdownButton(
                                    underline: Container(),
                                    isExpanded: true,
                                    value: dropdownvalue,
                                    icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.7.h,color: Colors.black,),
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
                              ),
                              SizedBox(width: 4.w,),
                              Container(
                                height: 3.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black12,width: 1)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                  child: DropdownButton(
                                    underline: Container(),
                                    isExpanded: true,
                                    value: dropdownvalue,
                                    icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.7.h,color: Colors.black,),
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
                              ),
                              SizedBox(width: 3.w,),
                              Icon(Icons.delete,color: Colors.red,size: 20,),
                            ],
                          ),
                        ),
                      ),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
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
