import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../create_password_screen/create_password_screen.dart';
import '../login_screen/login_screen.dart';
import '../signup_detail_screen/signup_detail_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int index = 2;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        widgets: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 9.h,
              ),
              Image(
                image: AssetImage('assets/images/app_logo.png'),
                height: 8.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Start 7 days Free Trial',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 54.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == 1 ? redColor : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, horizontal: 5.w),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: index == 1 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == 2 ? blueColor : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, horizontal: 3.w),
                          child: Text(
                            'Mobile Number',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: index == 2 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              if (index == 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: CustomTextField(
                    hintText: 'Enter Email',
                    controller: emailController,
                  ),
                ),
              if (index == 2)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: CustomTextField(
                    hintText: 'Enter Mobile Number',
                    controller: phoneController,
                  ),
                ),
              SizedBox(
                height: 7.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpDetailScreen(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: blueColor),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 4.w),
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.withAlpha(200),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Already a Member? ',
                    style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                TextSpan(
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    text: 'Login',
                    style: TextStyle(
                        color: Color(0xffAD172A),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold))
              ])),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
