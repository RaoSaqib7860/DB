import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  final int? index;
  const CheckoutScreen({this.index,Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController checkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Share your Product',
                  style: TextStyle(
                    color: Color(0xff484848),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding:  EdgeInsets.only(left: 6.w,right: 6.w),
                child: Text(
                  'QUANTITY',
                  style: TextStyle(fontSize: 10.sp,color: Color(0xff484848)),
                ),
              ),
              SizedBox(height: 01.h,),
              Padding(
                padding:  EdgeInsets.only(left: 6.w,right: 6.w,),
                child: Container(
                  height: 3.5.h,
                  child: TextField(
                    style: TextStyle(fontSize: 10.sp),
                    controller: checkController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      hintText: '1',
                      labelStyle: TextStyle(fontSize: 9.sp,color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 9.sp),
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 20,),
                      //Column(children: [Icon(Icons.arrow_drop_up,size: 20,),Icon(Icons.arrow_drop_down,size: 18,)],),
                      contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h,),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/link.svg',height: 2.4.h,),
                    SizedBox(width: 2.w,),
                    Text(
                      'Product Link',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'yourproduct/dialboxx.com',
                      style: TextStyle(
                          fontSize: 9.7.sp,
                          color: blueColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/fold.svg',height: 2.3.h,),

                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Share on social media',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: Color(0xff484848)
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/fbb.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/wap.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/in.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/xx.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/instaa.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset('assets/svgs/tt.svg',height: 4.h,),
                    SizedBox(width: 2.w,),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  'Click on the icon to share',
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 1.5.h,),
              // Padding(
              //   padding:  EdgeInsets.symmetric(horizontal: 4.w),
              //   child: Container(
              //     // height: 20.h,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(color: Colors.black12,width: 1)
              //     ),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Padding(
              //               padding:  EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h),
              //               child: Text(
              //                 'Create Express Checkout Url For Direct Order',
              //                 style: TextStyle(fontSize: 11.sp,color: Colors.black54),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Row(
              //           children: [
              //             Padding(
              //               padding:  EdgeInsets.only(left: 4.w,right: 4.w,top: 1.h),
              //               child: Text(
              //                 'Product Meta',
              //                 style: TextStyle(fontSize: 11.sp,color: Colors.black54),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Row(
              //           children: [
              //             Padding(
              //               padding:  EdgeInsets.only(left: 2.w,right: 2.w,top: 1.h),
              //               child: Text(
              //                 'QUANTITY',
              //                 style: TextStyle(fontSize: 10.sp,color: Colors.black54),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Padding(
              //           padding:  EdgeInsets.only(left: 2.w,right: 2.w,top: 1.2.h),
              //           child: Container(
              //             height: 3.h,
              //             child: TextField(
              //               style: TextStyle(fontSize: 10.sp),
              //               controller: checkController,
              //               decoration: InputDecoration(
              //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              //                 hintText: 'Quantity',
              //                 labelStyle: TextStyle(fontSize: 9.sp,color: Colors.grey),
              //                 hintStyle: TextStyle(fontSize: 9.sp),
              //                 suffixIcon: Icon(Icons.arrow_drop_down_sharp,size: 20,),
              //                 //Column(children: [Icon(Icons.arrow_drop_up,size: 20,),Icon(Icons.arrow_drop_down,size: 18,)],),
              //                 contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: 1.h,)
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 6.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                        Get.offAll(BottomSheetScreen(index: 2,));
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
