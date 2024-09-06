import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_list_tile.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7.h,
              width: 100.w,
              color: blueColor,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 3.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 4.h,
                          width: 10.w,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svgs/back_arrow.svg',
                              height: 3.h,
                            ),
                          ),
                        )),
                    SizedBox(width: 31.w,),
                    Text(
                      'Subscriptions',
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
              padding: EdgeInsets.symmetric(horizontal: 4.w,),
              child: Text(
                'Order #DB193',
                style: TextStyle(
                    color: blueColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w,),
                child: Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 3.w,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h,),
                        CustomListTie(
                          text: 'Order Number',
                          widget: Text(
                            '#DB193',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Order Status',
                          widget: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: blueColor
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                              child: Text(
                                "Approved",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Order Created Date',
                          widget: Text(
                            '2024-03-14',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Order Created At',
                          widget: Text(
                            '5 Months ago',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Order Will Be Expired',
                          widget: Text(
                            '2025-03-14',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Order Amount',
                          widget: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rs: ',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color(0xff535353),
                                      fontWeight: FontWeight.bold
                                  )
                                ),
                                TextSpan(
                                    text: '14,999',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: blueColor,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ]
                            ),
                          )
                        ),
                        CustomListTie(
                            text: 'Order Tax Amount',
                            widget: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Rs: ',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Color(0xff535353),
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(
                                        text: '0',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: blueColor,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                  ]
                              ),
                            )
                        ),
                        CustomListTie(
                          text: 'Plan Name',
                          widget: Text(
                            'E-Commerce Basic',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Payment Mode',
                          widget: Text(
                            'Jazz Cash',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: redColor,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Transaction ID',
                          widget: Text(
                            'T20240914143333',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Transaction Status',
                          widget: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: blueColor
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                              child: Text(
                                "Paid",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Jazz Cash Payment Status',
                          widget: Text(
                            'Completed',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: blueColor
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.2.h),
                            child: Text(
                              "This takes 15 min to verifies from jazzcash server ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w,),
              child: Text(
                'User Information',
                style: TextStyle(
                    color: blueColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w,),
                child: Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 3.w,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h,),
                        CustomListTie(
                          text: 'User Name',
                          widget: Text(
                            'Your user name',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'User Email',
                          widget: Text(
                            'useremail@email.com',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'User Domain',
                          widget: Text(
                            'userdomain.com.pk',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Domain Status',
                          widget: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: blueColor
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                              child: Text(
                                "Active",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/svgs/frame.svg',height: 3.h,),
                            SizedBox(width: 3.w,),
                            Text(
                              'Download Invoice',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Color(0xff535353)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,),
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
    );
  }
}
