import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class TransactionAllOrderScreen extends StatefulWidget {
  const TransactionAllOrderScreen({Key? key}) : super(key: key);

  @override
  State<TransactionAllOrderScreen> createState() => _TransactionAllOrderScreenState();
}

class _TransactionAllOrderScreenState extends State<TransactionAllOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
          return Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.5.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 0.7,color: Colors.black)
                            ),
                            child: Center(
                              child: Icon(Icons.image,color: blueColor,size: 3.5.h,),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order #31245',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height: 1.h,),
                                      Text(
                                        'Rs. 200',
                                        style: TextStyle(
                                            color: blueColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '22/10/2022',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp,
                                        ),
                                      ),
                                      SizedBox(height: 0.3.h,),
                                      Container(
                                        color: Color(0xffF0C9D0),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.3.h),
                                          child: Text(
                                            'COD',
                                            style: TextStyle(
                                                color: redColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'In Process*',
                            style: TextStyle(
                                color: redColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(width: 0.6,color: Colors.black)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.2.h),
                              child: Row(
                                children: [
                                  Text(
                                    'Detail',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(width: 2.w,),
                                  Icon(Icons.keyboard_arrow_right,color: Colors.black,size: 2.h,),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,)
            ],
          );
        },),
        Positioned(
          bottom: 15.h,
            right: 0.w,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 0.6,color: Colors.black)
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 0.5.h),
                child: Row(
                  children: [
                    SizedBox(width: 1.w,),
                    SvgPicture.asset('assets/svgs/arrow-down.svg',height: 1.5.h,),
                    SizedBox(width: 1.w,),
                    Text(
                      'Download Report',
                      style: TextStyle(
                        color: Color(0xffA1A1A1),
                        fontSize: 8.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
      ],
    );
  }
}
