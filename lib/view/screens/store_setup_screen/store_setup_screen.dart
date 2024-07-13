import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../add_product_screen/add_product_screen.dart';
import '../payment_screen/payment_screen.dart';
import '../store_add_product_screen.dart';

class StoreSetupScreen extends StatefulWidget {

   StoreSetupScreen({Key? key}) : super(key: key);

  @override
  State<StoreSetupScreen> createState() => _StoreSetupScreenState();
}

class _StoreSetupScreenState extends State<StoreSetupScreen> {

  bool _isButtonEnabled = false;

  // @override
  // void initState() {
  //  // _isButtonEnabled = true;
  //
  //   super.initState();
  //   widget.price.toString();
  //   widget.quantity.toString();
  //   widget.name.toString();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   widget.price!.addListener(_checkButtonStatus);
  //   priceController.addListener(_checkButtonStatus);
  //   quanController.addListener(_checkButtonStatus);
  // }
  //
  // @override
  // void dispose() {
  //   nameController.dispose();
  //   priceController.dispose();
  //   quanController.dispose();
  //   super.dispose();
  // }
  //
  // void _checkButtonStatus() {
  //   nameController = TextEditingController(text: widget.name);
  //   priceController = TextEditingController(text: widget.price);
  //   quanController = TextEditingController(text: widget.quantity);
  //   setState(() {
  //     _isButtonEnabled = widget.isNotEmpty &&
  //         priceController.text.isNotEmpty && quanController.text.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 100.w,
                height: 50.h,
                color: blueColor,
                child: Column(
                  children: [
                    SizedBox(height: 9.h,),
                    CircularPercentIndicator(
                      radius: 5.3.h,
                      animation: true,
                      lineWidth: 1.w,
                      percent: 0.25,
                      center: Text(
                        '25%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.square,
                      progressColor: redColor,
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      'Store setup is Complete',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      'Finish following steps to unlock features ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 30.h,
            left: 5.w,
            child: Container(
              width: 90.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                  //BoxShadow(color: Colors.grey.withAlpha(100),offset: Offset(-1, 1),spreadRadius: 1,blurRadius: 2),
                  //BoxShadow(color: Colors.grey.withAlpha(100),offset: Offset(1, -1),spreadRadius: 1,blurRadius: 2),
                  BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                ]
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w,right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                            color: blueColor,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(Icons.check,color: Colors.white,size: 3.h,),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Created Online Store',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 0.4.h,),
                            Text(
                              'Congratulations on Opening your new\nonline store!',
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 0.4.h,),
                            Text(
                              'Visit Store.',
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: blueColor,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: blueColor,
                                height: 0.14.h,
                                decorationThickness: 0.3.h
                                //fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w,right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                              color: Color(0xffD6EDFF),
                              shape: BoxShape.circle,
                            border: Border.all(color: blueColor,width: 1)
                          ),
                          child: Center(
                            child:  Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: blueColor,
                                 // fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StoreAddProductScreen(),));
                              },
                              child: Text(
                                'Add Product',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: blueColor,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            SizedBox(height: 0.4.h,),
                            Text(
                              'Set up your first product by adding\nthe product name and image.',
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.black,
                                //fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 0.6.h,),
                            // widget.name!.isNotEmpty && widget.quantity!.isNotEmpty && widget.price!.isNotEmpty
                            // ? SizedBox() :
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StoreAddProductScreen(),));
                              },
                              child: Container(
                                color: blueColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                                  child: Text(
                                    'Add Product',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w,right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                              //color: Color(0xffD6EDFF),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Center(
                            child:  Text(
                              '3',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                // fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Setup Payment Method',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: blueColor,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 0.4.h,),
                            Text(
                              'Choose how you would like to\nreceive payment for your orders.',
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.black,
                                //fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 0.6.h,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                              },
                              child: Container(
                                color: blueColor,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
                                  child: Text(
                                    'Setup Now',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 2.h,
              left: 5.w,
              child: Container(
                height: 5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Complete your Store Setup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
