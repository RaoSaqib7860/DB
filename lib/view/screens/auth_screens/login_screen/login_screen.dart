import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../forgot_password_screen/forgot_password_screen.dart';
import '../signup_detail_screen/SignUp Provider/sign_up_provider.dart';
import '../signup_detail_screen/signup_detail_screen.dart';
import 'Login Provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    final LoginProvider provider = Provider.of<LoginProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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
                                'Email'.tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color:
                                      index == 1 ? Colors.white : Colors.black,
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
                                'Mobile Number'.tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color:
                                      index == 2 ? Colors.white : Colors.black,
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
                        hintText: 'Enter email'.tr,
                        controller: provider.emailController,
                      ),
                    ),
                  if (index == 2)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: CustomTextField(
                        hintText: 'Enter mobile number'.tr,
                        controller: provider.phoneController,
                      ),
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: CustomTextField(
                      hintText: 'Enter Password'.tr,
                      controller: provider.passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ));
                          },
                          child: Text(
                            'Forget Password'.tr,
                            style: TextStyle(fontSize: 12.sp, color: redColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.login_api(
                          context: context,
                          is_email: index == 1 ? true : false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: blueColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.7.h, horizontal: 14.w),
                        child: Text(
                          'Log In'.tr,
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
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
                        text: 'For Registration? '.tr,
                        style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(ChangeNotifierProvider(
                              create: (c) => SignUpProvider(),
                              child: SignUpDetailScreen(),
                            ));
                          },
                        text: 'Sign Up'.tr,
                        style: TextStyle(
                          color: Color(0xffAD172A),
                          fontSize: 15.sp,
                          //fontWeight: FontWeight.bold
                        ))
                  ])),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
