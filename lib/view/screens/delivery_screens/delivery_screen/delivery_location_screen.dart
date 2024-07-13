import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';

class DeliveryLocationScreen extends StatefulWidget {
  const DeliveryLocationScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryLocationScreen> createState() => _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState extends State<DeliveryLocationScreen> {
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return ind == 0 ?
      Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
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
                                child: Text(items,style: TextStyle(fontSize: 8.sp,color: Colors.black),),
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
                              style: TextStyle(fontSize: 8.sp,color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ListView.builder(
                    itemCount: 3,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 0.5.h,),
                                    Text(
                                      "Delivery Location:",
                                      style: TextStyle(
                                          color: Colors.black,
                                        fontSize: 12.sp
                                      ),
                                    ),
                                    //SizedBox(height: 0.5.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sialkot",
                                          style: TextStyle(
                                              color: Color(0xff005493),
                                              fontSize: 14.sp,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "CREATED AT",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8.sp,
                                              ),
                                            ),
                                            SizedBox(height: 0.6.h,),
                                            Container(
                                              color: Color(0xffF0C9D0),
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                                child: Text(
                                                  '8 months ago',
                                                  style: TextStyle(
                                                      color: redColor,
                                                      fontSize: 9.sp,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 1.h,),
                                    Divider(
                                      thickness: 0.8,
                                      color: Color(0xff707070),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              ind = 1;
                                              setState(() {

                                              });
                                            },
                                            child: SvgPicture.asset('assets/svgs/action.svg',height: 3.h,)),
                                        SizedBox(width: 2.w,),
                                        Text(
                                          "Action",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10  .sp
                                          ),
                                        ),
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
                    },),
                ))
          ],
        ),
        Positioned(
          bottom: 2.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                ind = 1;
                setState(() {
                });
              },
              child: Container(
                height: 5.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Create Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ) :
        ind == 1 ?
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:5.w),
                  child: Text(
                    'Create Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontSize: 12.sp
                    ),
                  ),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.w),
                  child: Text(
                    'Delivery Location Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withAlpha(170),
                        fontSize: 10.sp
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.w),
                  child: Container(
                    height: 3.h,
                    //width: 90.w,
                    child: TextField(
                      //controller: widget.controller,
                      style: TextStyle(fontSize: 10.sp,color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Type here',
                          hintStyle: TextStyle(fontSize: 10.sp),
                          contentPadding: EdgeInsets.only(bottom: 1.6.h)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 2.h,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: GestureDetector(
                  onTap: () {
                    ind = 0;
                    setState(() {
                    });
                  },
                  child: Container(
                    height: 5.5.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(5),
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
              ),
            )
          ],
        ) :
    SizedBox();
  }
}
