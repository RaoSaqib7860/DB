import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/custom_toast.dart';
import 'order_detail_form_screen.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        leading: Padding(
          padding:EdgeInsets.only(left: 5.w),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 5.h,)),
        ),
        leadingWidth: 10.w,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Create Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 3.h),
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
                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                          child: Column(
                            children: [
                              SizedBox(height: 0.5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '#3268',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.remove,size: 1.5.h,color: Colors.grey,),
                                      SizedBox(width: 1.w,),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 1.w,),
                                      Icon(Icons.add,size: 1.5.h,color: Colors.grey,),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 11.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: Colors.grey,width: 1)
                                        ),
                                        child: Center(
                                          child: Icon(Icons.image,color: blueColor,size: 7.w,),
                                        ),
                                      ),
                                      SizedBox(width: 2.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Modren Chair Table',
                                            style: TextStyle(
                                              color: Color(0xff3E3E3E),
                                              fontSize: 11.sp
                                            ),
                                          ),
                                          SizedBox(height: 0.3.h,),
                                          Text(
                                            'Chair',
                                            style: TextStyle(
                                                color: Color(0xff3E3E3E),
                                                fontSize: 11.sp
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    color: Color(0xffF0C9D0),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                                      child: Text(
                                        'Rs1,500.00',
                                        style: TextStyle(
                                          color: redColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 0.5.h,),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              SizedBox(height: 0.5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    'Item added to cart',
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
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
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svgs/cart.svg',height: 2.5.h,),
                                        SizedBox(width: 3.w,),
                                        Padding(
                                          padding:  EdgeInsets.only(top: 0.5.h),
                                          child: Text(
                                            'Add to cart',
                                            style: TextStyle(
                                                color: Color(0xff858585),
                                                fontSize: 11.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(width: 1,color: Color(0xff707070))
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 1.w,),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Select Variation',
                                            style: TextStyle(
                                              color: Color(0xff858585),
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(width: 1.w,),
                                          Icon(Icons.keyboard_arrow_up,color: Colors.black,size: 2.5.h,)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 7.h,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: GestureDetector(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         backgroundColor: Colors.white,
                    //         surfaceTintColor: Colors.white,
                    //         contentPadding: EdgeInsets.zero,
                    //         insetPadding: const EdgeInsets.all(1),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(1),
                    //         ),
                    //         content: Builder(
                    //           builder: (context) {
                    //             return Container(
                    //               width: double.infinity,
                    //               height: 26.h,
                    //               color: Colors.white,
                    //               child: Padding(
                    //                 padding:EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                    //                 child: Column(
                    //                   children: [
                    //                     Container(
                    //                       width: 100.w,
                    //                       decoration: BoxDecoration(
                    //                           color: Colors.white,
                    //                           borderRadius: BorderRadius.circular(3),
                    //                           boxShadow: [
                    //                             BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                    //                             BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                    //                           ]
                    //                       ),
                    //                       child: Padding(
                    //                         padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                    //                         child: Column(
                    //                           children: [
                    //                             SizedBox(height: 0.5.h,),
                    //                             Row(
                    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                               children: [
                    //                                 Text(
                    //                                   '#3268',
                    //                                   style: TextStyle(
                    //                                       color: Colors.black,
                    //                                       fontSize: 12.sp,
                    //                                       fontWeight: FontWeight.bold,
                    //                                       decoration: TextDecoration.underline
                    //                                   ),
                    //                                 ),
                    //                                 Text(
                    //                                   'Today, 4:18pm',
                    //                                   style: TextStyle(
                    //                                     color: Colors.black,
                    //                                     fontSize: 10.sp,
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                             SizedBox(height: 1.h,),
                    //                             Row(
                    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                               children: [
                    //                                 Row(
                    //                                   children: [
                    //                                     Container(
                    //                                       height: 5.h,
                    //                                       width: 11.w,
                    //                                       decoration: BoxDecoration(
                    //                                           borderRadius: BorderRadius.circular(5),
                    //                                           border: Border.all(color: Colors.grey,width: 1)
                    //                                       ),
                    //                                       child: Center(
                    //                                         child: Icon(Icons.image,color: blueColor,size: 7.w,),
                    //                                       ),
                    //                                     ),
                    //                                     SizedBox(width: 2.w,),
                    //                                     Column(
                    //                                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                                       mainAxisAlignment: MainAxisAlignment.start,
                    //                                       children: [
                    //                                         Text(
                    //                                           'Modren Chair Table',
                    //                                           style: TextStyle(
                    //                                               color: Color(0xff3E3E3E),
                    //                                               fontSize: 11.sp
                    //                                           ),
                    //                                         ),
                    //                                         SizedBox(height: 0.3.h,),
                    //                                         Text(
                    //                                           'Chair',
                    //                                           style: TextStyle(
                    //                                               color: Color(0xff3E3E3E),
                    //                                               fontSize: 11.sp
                    //                                           ),
                    //                                         )
                    //                                       ],
                    //                                     )
                    //                                   ],
                    //                                 ),
                    //                                 Container(
                    //                                   color: Color(0xffF0C9D0),
                    //                                   child: Padding(
                    //                                     padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                    //                                     child: Text(
                    //                                       'Rs1,500.00',
                    //                                       style: TextStyle(
                    //                                           color: redColor,
                    //                                           fontSize: 11.sp,
                    //                                           fontWeight: FontWeight.bold
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                             SizedBox(height: 0.5.h,),
                    //                             Divider(
                    //                               color: Colors.grey,
                    //                               thickness: 1,
                    //                             ),
                    //                             SizedBox(height: 0.5.h,),
                    //                             Row(
                    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                               children: [
                    //                                 Row(
                    //                                   children: [
                    //                                     Row(
                    //                                       children: [
                    //                                         Icon(Icons.remove,size: 1.5.h,color: Colors.grey,),
                    //                                         SizedBox(width: 1.w,),
                    //                                         Text(
                    //                                           '1',
                    //                                           style: TextStyle(
                    //                                             color: Colors.black87,
                    //                                             fontSize: 10.sp,
                    //                                           ),
                    //                                         ),
                    //                                         SizedBox(width: 1.w,),
                    //                                         Icon(Icons.add,size: 1.5.h,color: Colors.grey,),
                    //                                       ],
                    //                                     )
                    //                                   ],
                    //                                 ),
                    //                               ],
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(height: 2.h,),
                    //                     Row(
                    //                       children: [
                    //                         Expanded(
                    //                             child: Container(
                    //                               height: 4.h,
                    //                               color: blueColor,
                    //                               child: Center(
                    //                                 child: Text(
                    //                                   'Close',
                    //                                   style: TextStyle(
                    //                                     color: Colors.white,
                    //                                     fontSize: 11.sp,
                    //                                     fontWeight: FontWeight.bold
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             )
                    //                         ),
                    //                         SizedBox(width: 3.w,),
                    //                         Expanded(
                    //                             child: InkWell(
                    //                               onTap: () {
                    //                                 Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailFormScreen(),));
                    //                               },
                    //                               child: Container(
                    //                                 height: 4.h,
                    //                                 color: redColor,
                    //                                 child: Center(
                    //                                   child: Text(
                    //                                     'Proceed to checkout',
                    //                                     style: TextStyle(
                    //                                         color: Colors.white,
                    //                                         fontSize: 11.sp,
                    //                                         fontWeight: FontWeight.bold
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             )
                    //                         ),
                    //                       ],
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     },
                    // );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailFormScreen(),));
                  },
                  child: Container(
                    height: 5.5.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: Color(0xff005493),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
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
    );
  }
}
