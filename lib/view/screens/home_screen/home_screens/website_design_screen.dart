import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_toast.dart';

class WebsiteDesignScreen extends StatefulWidget {
  const WebsiteDesignScreen({Key? key}) : super(key: key);

  @override
  State<WebsiteDesignScreen> createState() => _WebsiteDesignScreenState();
}

class _WebsiteDesignScreenState extends State<WebsiteDesignScreen> {
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
                    SizedBox(width: 2.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 32.w,),
                    Text(
                      'Website Design',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 2.h,),
                  customContainer(
                    text: 'Active: Light speed',
                    bgColor: Colors.black,
                    containerColor: Color(0xffFEF60E),
                    cText: 'Customize',
                    textColor: Colors.white,
                    cTextColor: Colors.black
                  ),
                  customContainer(
                      text: 'Leo',
                      bgColor: Colors.white,
                      containerColor: blueColor,
                      cText: 'Apply',
                      textColor: Colors.black,
                      cTextColor: Colors.white
                  ),
                  customContainer(
                      text: 'Leo',
                      bgColor: Colors.white,
                      containerColor: blueColor,
                      cText: 'Apply',
                      textColor: Colors.black,
                      cTextColor: Colors.white
                  ),
                  customContainer(
                      text: 'Leo',
                      bgColor: Colors.white,
                      containerColor: blueColor,
                      cText: 'Apply',
                      textColor: Colors.black,
                      cTextColor: Colors.white
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select color theme',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withAlpha(170),
                            fontSize: 10.sp
                        ),
                      ),
                      Container(
                        height: 2.7.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'Theme Color',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.sp
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '000R,000G,000B',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 9.sp
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      Container(
                        height: 2.5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'RGB',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 9.sp
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '000R,000G,000B',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 9.sp
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      Container(
                        height: 2.5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      colorContainer(),
                      SizedBox(width: 6.w,),
                      colorContainer(),
                    ],
                  ),
                  SizedBox(height: 1.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      colorContainer(),
                      SizedBox(width: 6.w,),
                      colorContainer(),
                    ],
                  ),
                  SizedBox(height: 1.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      colorContainer(),
                      SizedBox(width: 6.w,),
                      colorContainer(),
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  GestureDetector(
                    onTap: () {
                      CustomToastManager.showToast(
                          context: context,
                          height: 32.h,
                          width: 100.w,
                          message: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              children: [
                                SizedBox(height: 2.h,),
                                Container(
                                  height: 20.h,
                                  child: Image(
                                    image: AssetImage('assets/images/cong.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                Text(
                                  'Congratulation!',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height: 0.5.h,),
                                Text(
                                  'your store has been setup',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customContainer({Color? cTextColor,String? text, Color? bgColor, Color? containerColor, String? cText,Color? textColor}){
    return Column(
      children: [
        Container(
          height: 25.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),blurRadius: 1),
                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),blurRadius: 1),
                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, 1),blurRadius: 1),
                BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, -1),blurRadius: 1),
              ]
          ),
          child: Column(
            children: [
              Container(
                height: 19.h,
                decoration: BoxDecoration(
                  color: Color(0xffE6E6E6),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5))
                ),
                child: Center(
                  child: Icon(Icons.image,color: blueColor,size: 23.w,),
                ),
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w,right: 5.w,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text!,
                            style: TextStyle(fontSize: 12.sp,color: textColor),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
                              child: Text(
                                cText!,
                                style: TextStyle(fontSize: 11.sp,color: cTextColor,),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
        SizedBox(height: 3.h,)
      ],
    );
  }

  Widget colorContainer(){
    return Expanded(
      child: Container(
        height: 2.7.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey
        ),
      ),
    );
  }

}
