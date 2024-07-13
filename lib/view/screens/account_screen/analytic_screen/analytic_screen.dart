import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_dialogue.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
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
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),

                      Text(
                        'Analytics',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 2.w,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Report',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                      child: customContainer(
                        image: 'bag',
                        title: 'Total Order',
                        subTitle: '11',
                        color: Color(0xff1568A8)
                      )
                  ),
                  SizedBox(width: 3.w,),
                  Expanded(
                      child: customContainer(
                          image: 'cancel',
                          title: 'Order Cancelled',
                          subTitle: '3',
                          color: Color(0xff9B001E)
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Expanded(
                      child: customContainer(
                          image: 'bag',
                          title: 'In Processing',
                          subTitle: '2',
                          color: Color(0xffD09611)
                      )
                  ),
                  SizedBox(width: 3.w,),
                  Expanded(
                      child: customContainer(
                          image: 'alll',
                          title: 'Order Complete',
                          subTitle: '2',
                          color: Color(0xff0CA011),
                        imageSize: 1.7.h
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customContainer(
                  image: 'bag',
                  title: 'Total Amount',
                  subTitle: 'Rs192,135.20',
                  color: Color(0xff1568A8)
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customContainer(
                  image: 'amount',
                  title: 'Canceled Amount',
                  subTitle: 'Rs192,135.20',
                  color: Color(0xff9B001E),
                imageSize: 1.7.h
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customContainer(
                  image: 'amount',
                  title: 'Pending Amount',
                  subTitle: 'Rs192,135.20',
                  color: Color(0xff9D09611),
                  imageSize: 1.7.h
              ),
            ),
            SizedBox(height: 1.5.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customContainer(
                  image: 'amount',
                  title: 'Earning Amount',
                  subTitle: 'Rs192,135.20',
                  color: Color(0xff0CA011),
                  imageSize: 1.7.h
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        customDialogue(
                            context: context,
                            height: 33.h,
                            content: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Apply Filter',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset('assets/svgs/cross.svg',height: 2.5.h,)),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Text(
                                    'Filter by date',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Starting date',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'mm/dd/yyyy',
                                                  style: TextStyle(
                                                      color: Color(0xff454545),
                                                      fontSize: 10.sp
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/svgs/calender.svg',height: 2.3.h,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'End date',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'mm/dd/yyyy',
                                                  style: TextStyle(
                                                      color: Color(0xff454545),
                                                      fontSize: 10.sp
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/svgs/calender.svg',height: 2.3.h,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1.h,),
                                  Divider(thickness: 1,color: Colors.grey,),
                                  SizedBox(height: 1.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.w, right: 4.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Reset Filter',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.7.h),
                                            child: Text(
                                              'View Results',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        );
                      },
                      child: SvgPicture.asset('assets/svgs/comp.svg',height: 2.5.h,)
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice No',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '#ocatine377',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Customer',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Hamza',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Colors.green,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.sp
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Item (s)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '12345',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 23.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '14-February-2024',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Order total',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '5,990.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Fulfillment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Colors.green,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.sp
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Invoice',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Color(0xff9B001E),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 0.6.w, vertical: 0.1.h),
                              child: Icon(Icons.remove_red_eye,color: Colors.white,size: 2.2.h,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice No',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '#ocatine377',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Customer',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Hamza',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Colors.green,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.sp
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Item (s)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '12345',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 23.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '14-February-2024',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Order total',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            '5,990.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Fulfillment',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Colors.green,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9.sp
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Text(
                            'Invoice',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp
                            ),
                          ),
                          SizedBox(height: 0.8.h,),
                          Container(
                            color: Color(0xff9B001E),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 0.6.w, vertical: 0.1.h),
                              child: Icon(Icons.remove_red_eye,color: Colors.white,size: 2.2.h,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Traffic',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Image(image: AssetImage('assets/images/tra.png'),height: 35.h,width: 100.w,fit: BoxFit.fill,),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Most Visit Pages',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image(image: AssetImage('assets/images/chrome.png'),height: 7.h,width: 14.w,),
                                SizedBox(height: 1.h,),
                                Text(
                                  'Chrome',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  '11',
                                  style: TextStyle(
                                      color: Color(0xff6F6F6F),
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image(image: AssetImage('assets/images/safari.png'),height: 7.h,width: 14.w,),
                                SizedBox(height: 1.h,),
                                Text(
                                  'Safari',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  '11',
                                  style: TextStyle(
                                      color: Color(0xff6F6F6F),
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image(image: AssetImage('assets/images/fire.png'),height: 7.h,width: 14.w,),
                                SizedBox(height: 1.h,),
                                Text(
                                  'Firefox',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  '11',
                                  style: TextStyle(
                                      color: Color(0xff6F6F6F),
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image(image: AssetImage('assets/images/edge.png'),height: 7.h,width: 14.w,),
                                SizedBox(height: 1.h,),
                                Text(
                                  'Edge',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  '11',
                                  style: TextStyle(
                                      color: Color(0xff6F6F6F),
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visitors',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '1159',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  'Total Pages Visited',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [

                                Text(
                                  '28',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  'Unique Visitors',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '640 mins',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  'Total Time Spent',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9.sp
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
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

  Widget customContainer({String? image, String? title, String? subTitle, Color? color, double? imageSize}){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.2.h),
        child: Row(
          children: [
            Container(
              height: 5.h,
              width: 10.w,
              color: color,
              child: Center(
                child: SvgPicture.asset('assets/svgs/$image.svg',height: imageSize != null ? imageSize : 2.5.h,),
              ),
            ),
            SizedBox(width: 3.w,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 9.sp
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      subTitle!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
