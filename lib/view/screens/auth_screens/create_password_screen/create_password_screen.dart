import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../signup_detail_screen/signup_detail_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        is_back_btn: true,
        widgets: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 9.h,),
              Image(image: AssetImage('assets/images/app_logo.png'),height: 8.h,),
              SizedBox(height: 17.h,),
              Text(
                'Create Password'.tr,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 4.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Text(
                      'Password'.tr,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: CustomTextField(
                  obsecureText: true,
                  hintText: 'Enter Password'.tr,
                  controller: passwordController,
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Text(
                      'Confirm Password'.tr,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: CustomTextField(
                  obsecureText: true,
                  hintText: 'Enter Confirm Password'.tr,
                  controller: cPasswordController,
                ),
              ),
              SizedBox(height: 3.h,),
              GestureDetector(
                onTap: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpDetailScreen(),));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: blueColor
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 0.7.h,horizontal: 14.w),
                    child: Text(
                      'Finish'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
