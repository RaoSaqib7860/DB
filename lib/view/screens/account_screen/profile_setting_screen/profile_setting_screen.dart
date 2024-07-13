import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_form_field.dart';
import '../../../../custom_widgets/custom_toast.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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
                child: Row(
                  children: [
                    SizedBox(width: 3.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 30.w,),
                    Text(
                      'Profile Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                'Edit General Settings',
                style: TextStyle(
                  color: blueColor,
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            CustomFormField(name: 'Name', hint: 'Type here',),
            CustomFormField(name: 'Email', hint: 'Type here',),
            GestureDetector(
              onTap: () {
                CustomToastManager.showToast(
                  context: context,
                    height: 15.h,
                    width: 100.w,
                  message: Column(
                    children: [
                      SizedBox(height: 3.h,),
                      SvgPicture.asset('assets/svgs/set_update.svg',height: 6.h,),
                      SizedBox(height: 1.5.h,),
                      Text(
                        'Settings Updated',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black
                        ),
                      ),

                    ],
                  )
                );
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: blueColor
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                'Change Password',
                style: TextStyle(
                    color: blueColor,
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            CustomFormField(name: 'Old Password', hint: 'Type here',),
            CustomFormField(name: 'New Password', hint: 'Type here',),
            CustomFormField(name: 'Conform Password', hint: 'Type here',),
            GestureDetector(
              onTap: () {
                CustomToastManager.showToast(
                    context: context,
                    height: 15.h,
                    width: 100.w,
                    message: Column(
                      children: [
                        SizedBox(height: 3.h,),
                        SvgPicture.asset('assets/svgs/pass_update.svg',height: 4.h,),
                        SizedBox(height: 1.5.h,),
                        Text(
                          'Password Updated',
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.black
                          ),
                        ),

                      ],
                    )
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: redColor
                  ),
                  child: Center(
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
