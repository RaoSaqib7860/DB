import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  final String? email;
  const ConfirmPasswordScreen({Key? key, this.email}) : super(key: key);

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  bool loading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                      'Confirm Password'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomTextField(
                        hintText: 'New Password'.tr,
                        controller: passwordController,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomTextField(
                        hintText: 'Re-enter Password'.tr,
                        controller: confirmPasswordController,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          setState(() {
                            loading = true;
                          });
                          bool result =
                              await DataProvider().resetPasswordFunction(map: {
                            'new_password': passwordController.text,
                            'confirm_password': confirmPasswordController.text,
                            'email': widget.email,
                          });
                          setState(() {
                            loading = false;
                          });
                          if (result) {
                            Get.offAll(LoginScreen());
                          }
                        } else {
                          Get.snackbar('Alert'.tr, 'Password not matched.'.tr);
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
