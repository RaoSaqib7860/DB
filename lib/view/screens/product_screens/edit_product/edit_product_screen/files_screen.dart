import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/custom_toast.dart';

class FilesScreen extends StatefulWidget {
  final int? index;
  const FilesScreen({this.index,Key? key}) : super(key: key);

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  TextEditingController urlController = TextEditingController();
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your customer will receive automatically\nthe download link via email',
                      style: TextStyle(fontSize: 9.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

                          ),
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: SingleChildScrollView(
                                child: Container(
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(Icons.close))),
                                      ),
                                      SizedBox(height: 5.h,),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 4.w),
                                            child: Text(
                                              'Add New File',
                                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 7.h,),
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
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 4.w),
                                          child: Container(
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                                color: redColor,
                                                borderRadius: BorderRadius.circular(3)
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Save Changes',
                                                style: TextStyle(color: Colors.white,fontSize: 10.sp,),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.7.h),
                          child: Text(
                            'Create file',
                            style: TextStyle(color: Colors.white,fontSize: 9.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              // Padding(
              //   padding:  EdgeInsets.symmetric(horizontal: 6.w),
              //   child: Container(
              //     height: 7.h,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(spreadRadius: 1,color: Colors.black12,offset: Offset(1, 1)),
              //         BoxShadow(spreadRadius: 1,color: Colors.black12,offset: Offset(-1, -1)),
              //       ],
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Center(
              //       child: Column(
              //         children: [
              //           SizedBox(height: 1.h,),
              //           Row(
              //             children: [
              //               Padding(
              //                 padding:  EdgeInsets.symmetric(horizontal: 4.w),
              //                 child: Text(
              //                     'URL',
              //                 style: TextStyle(fontSize: 10.sp,color: Colors.grey),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: 0.4.h,),
              //           Row(
              //             children: [
              //               Padding(
              //                 padding:  EdgeInsets.only(left: 4.w,right: 4.w,),
              //                 child: Container(
              //                   height: 3.h,
              //                   width: 65.w,
              //                   child: TextField(
              //                     style: TextStyle(fontSize: 12.sp),
              //                     controller: urlController,
              //                     decoration: InputDecoration(
              //                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              //                       hintText: 'http://youtube/username.com',
              //                       labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
              //                       hintStyle: TextStyle(fontSize: 10.sp),
              //                       contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Icon(Icons.edit_square,color: Colors.blue,size: 17,),
              //               SizedBox(width: 1.w,),
              //               Icon(Icons.delete,color: Colors.red,size: 17,),
              //
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 13.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                    SizedBox(width: 3.w,),
                    Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 0.8.h),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white,fontSize: 10.sp),
                        ),
                      ),
                    )
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
