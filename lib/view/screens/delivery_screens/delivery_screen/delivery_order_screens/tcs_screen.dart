import 'dart:async';

import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/custom_form_field.dart';
import '../../delivery_main_screen.dart';

class TcsScreen extends StatefulWidget {
  const TcsScreen({Key? key}) : super(key: key);

  @override
  State<TcsScreen> createState() => _TcsScreenState();
}

class _TcsScreenState extends State<TcsScreen> {
  var items = [
    'Yes',
    'No',
  ];
  String dropdownvalue = 'Yes';

  late ScrollController _scrollController;
  late Timer _timer;
  double _scrollPosition = 0.0;
  final double _scrollIncrement = 300.0;
  List<String> _imageUrls = [
    'assets/images/delivery_women.png',
    'assets/images/delivery_women2.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Start the timer when the widget is initialized
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
        _scrollPosition = 0.0; // Start from the beginning
      } else {
        _scrollPosition += _scrollIncrement;
      }
      _scrollController.animateTo(
        _scrollPosition,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: blueColor,
                image: DecorationImage(image: AssetImage('assets/images/bg1.png'),fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4.h,),
                                  Text(
                                    'Fulfill your Order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h,),
                                  Text(
                                    'directly with Dialboxx',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h,),
                                  Text(
                                    'Delivery Partners',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp
                                    ),
                                  ),
                                  SizedBox(height: 3.h,),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svgs/pickup.svg',height: 3.h,),
                                      SizedBox(width: 2.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pickup',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                          SizedBox(height: 0.5.h,),
                                          Text(
                                            'and Delivery',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h,),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/svgs/cod.svg',height: 3.h,),
                                      SizedBox(width: 3.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'COD',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                          SizedBox(height: 0.5.h,),
                                          Text(
                                            'Available',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h,),
                                ],
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            //height: 30.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _scrollController,
                              //reverse: true,
                              child: Row(
                                children: _imageUrls
                                    .map((imageUrl) => Image.asset(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                  height: 26.h,
                                    ))
                                    .toList(),
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              'Set up Pickup Address ',
              style: TextStyle(
                color: Color(0xff1568A8),
                fontSize: 13.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 4.h,),
            CustomFormField(name: 'Pickup City*',hint: 'DB-807029',),
            CustomFormField(name: 'Business Name',hint: 'Select Order',),
            CustomFormField(name: 'Return Address',hint: 'Customer complete address`',),
            CustomFormField(name: 'Contact Number*',hint: '03000003003',),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:8.w),
                  child: Text(
                    'Delivery Location',
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
                    height: 4.2.h,
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Padding(
                        padding:  EdgeInsets.only(bottom: 0.2.h),
                        child: Container(color: Colors.grey,height: 0.1.h,width: 100.w,),
                      ),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.5.h,color: Colors.grey,),
                      value: dropdownvalue,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,style: TextStyle(fontSize: 9.sp,color: Colors.black.withAlpha(170)),),
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
              ],
            ),
            SizedBox(height: 9.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryMainScreen(),));
                },
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Finish Setup',
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
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }
}
