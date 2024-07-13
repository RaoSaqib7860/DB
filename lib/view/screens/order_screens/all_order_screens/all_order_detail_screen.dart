import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_toast.dart';
import 'edit_shipping_address_screen.dart';

class AllOrderDetailScreen extends StatefulWidget {
  const AllOrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<AllOrderDetailScreen> createState() => _AllOrderDetailScreenState();
}

class _AllOrderDetailScreenState extends State<AllOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 31.w,),
                    Text(
                      'Order #31245',
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
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  Text(
                                    'Modren Chair Table Chair',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  Text(
                                    'Islamabad by xyz in 2 days',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 3.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  customText(text: '1500 × 1'),
                                  customText(text: 'Shipping Fee'),
                                  customText(text: 'Tax'),
                                  customText(text: 'Discount'),
                                  customText(text: 'Subtotal'),
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 1.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  customText(text: 'Rs1,500.00'),
                                  customText(text: 'Rs350.00'),
                                  customText(text: 'Rs0.00'),
                                  customText(text: 'Rs0.00'),
                                  customText(text: 'Rs1,500.00'),
                                  Text(
                                    'Rs1,850.00',
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/empty_checkbox.svg',height: 2.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Notify to customer',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9.sp
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            width: 37.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(width: 1,color: Color(0xffA0A0A0))
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.1.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment complete',
                                    style: TextStyle(
                                      color: Color(0xff686868),
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff686868),size: 2.6.h,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 37.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(width: 1,color: Color(0xffA0A0A0))
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(
                                        'Complete',
                                        style: TextStyle(
                                          color: Color(0xff686868),
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff686868),size: 2.6.h,)
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: blueColor,
                                      borderRadius: BorderRadius.circular(3)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.9.h),
                                      child: Text(
                                        'Print',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w,),
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
                                                  SvgPicture.asset('assets/svgs/pro_toast.svg',height: 4.h,),
                                                  SizedBox(width: 5.w,),
                                                  Text(
                                                    'Order Updated',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
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
                                          color: blueColor,
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.9.h),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 3.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Text(
                            'Status',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment Status',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                  child: Text(
                                    'Paid',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Status',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                  child: Text(
                                    'Complete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Text(
                            'Payment Mode',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction Method',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(3)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                  child: Text(
                                    'Cash on Delivery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction Id',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Text(
                                'PXSlhkgG2u',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Text(
                            'Note',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Text(
                            '14121',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Text(
                            'Customer',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Text(
                            'Guest Customer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Text(
                            'Shipping detail',
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                detailContainer(text: 'Customer Name: Furqan Mustafa'),
                                detailContainer(text: 'Customer Email: netbee247@gmail.com'),
                                detailContainer(text: 'Customer Phone: 03001234567'),
                                detailContainer(text: 'Location: Islamabad'),
                                detailContainer(text: 'Zip Code: 45000'),
                                detailContainer(text: 'Address: Islamabad, Jinnah Super'),
                                detailContainer(text: 'Shipping Method: Islamabad by xyz in 2 days'),
                                SizedBox(height: 1.h,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditShippingAddressScreen(),));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(3)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
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
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          detailContainer(text: 'Code Center: 807029'),
                          detailContainer(text: 'Customer Name: Furqan Mustafa'),
                          detailContainer(text: 'Address: Islamabad, Jinnah Super'),
                          detailContainer(text: 'Mobile #: 03001234567'),
                          detailContainer(text: 'Email: netbee247@gmail.com'),
                          detailContainer(text: 'Sending City: KARACHI'),
                          detailContainer(text: 'Destination Location: Islamabad'),
                          detailContainer(text: 'Item weight: 1/kg'),
                          detailContainer(text: 'No of item: 1'),
                          detailContainer(text: 'COD charges: 350'),
                          detailContainer(text: 'Customer Reference No: 543545'),
                          detailContainer(text: 'Customer Reference No: 543545'),
                          detailContainer(text: 'Your generated CN  is: 5434232545'),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: redColor
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 0.5.h),
                                child: Text(
                                  'Print Label',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 0.6.h,),
                          detailContainer(text: 'Booking Date/Time: 2024-02-23 06:51:39'),
                          SizedBox(height: 1.h,),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget customText({String? text}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text!,
          style: TextStyle(
              fontSize: 9.sp,
              color: Colors.black
          ),
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }

  Widget detailContainer({String? text}){
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 0.5.h,
              width: 1.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
              ),
            ),
            SizedBox(width: 2.w,),
            Text(
              text!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 0.6.h)
      ],
    );
  }
}
