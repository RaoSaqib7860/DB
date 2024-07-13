import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_list_tile.dart';
import '../../../../../custom_widgets/custom_toast.dart';

class PlusScreen extends StatefulWidget {
  const PlusScreen({Key? key}) : super(key: key);

  @override
  State<PlusScreen> createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
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
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
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
                'E-Commerce Plus',
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
                      children: [
                        SizedBox(height: 2.h,),
                        CustomListTie(
                          text: 'Commission %',
                          widget: Text(
                            'ZERO',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Free Deliveries',
                          widget: Text(
                            '10',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Products Upload',
                          widget: Text(
                            'Unlimited',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Analytics',
                          widget: Text(
                            'Standard',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Staff Accounts',
                          widget: Text(
                            '5',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xff535353),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        CustomListTie(
                          text: 'Discount Codes',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        CustomListTie(
                          text: 'Marketing Tools',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        CustomListTie(
                          text: 'TCS Delivery System',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        CustomListTie(
                          text: 'Jazz Cash Payment Gateway',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        CustomListTie(
                          text: '24/7 Support',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        CustomListTie(
                          text: 'Custom Built Theme',
                          widget: SvgPicture.asset('assets/svgs/Subtract.svg',height: 2.3.h,),
                        ),
                        SizedBox(height: 1.h,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 13.h,),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomToastManager.showToast(
                      context: context,
                      height: 18.h,
                      width: 100.w,
                      message: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            SizedBox(height: 2.h,),
                            SvgPicture.asset('assets/svgs/e_comm.svg',height: 8.h,),
                            SizedBox(height: 1.h,),
                            Text(
                              'Congratulation you have successfully ',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 0.4.h,),
                            RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'purchase our ',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Plus Plan.',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: blueColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            )),
                          ],
                        ),
                      )
                  );
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 5.2.h,
                    decoration: BoxDecoration(
                      color: Color(0xff005493),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Purchase',
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
        ),
      ),
    );
  }
}
