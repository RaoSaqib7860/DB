import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email_controller = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: loading,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: CustomContainer(
            widgets: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 4.h,
                              width: 10.w,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svgs/back_arrow.svg',
                                  height: 3.h,
                                ),
                              ),
                            )),),
                    SizedBox(
                      height: 4.h,
                    ),
                    Image(
                      image: AssetImage('assets/images/app_logo.png'),
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Forgot Password'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Enter your Email or Number below and we will\n     send you a link to reset your Password.'.tr,
                      style: TextStyle(fontSize: 11.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomTextField(
                        hintText: 'Email or number'.tr,
                        controller: email_controller,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        var result = await DataProvider().forgetOtpSendFunction(
                            map: {'email': email_controller.text});
                        setState(() {
                          loading = false;
                        });
                        if (result) {
                          Get.to(OtpScreens(
                            email: email_controller.text,
                          ));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: blueColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.7.h, horizontal: 14.w),
                          child: Text(
                            'Submit'.tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
