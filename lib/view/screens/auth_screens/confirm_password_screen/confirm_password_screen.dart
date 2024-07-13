import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../forgot_password_screen/Forget Provider/foget_provider.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    final ForgetOtpProvider provider = Provider.of<ForgetOtpProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: CustomContainer(
          widgets: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,color: blueColor,size: 2.5.h,)
                      )
                  ),
                  SizedBox(height: 4.h,),
                  Image(image: AssetImage('assets/images/app_logo.png'),height: 8.h,),
                  SizedBox(height: 12.h,),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomTextField(
                      hintText: 'New Password',
                      controller: provider.passwordController,
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomTextField(
                      hintText: 'Re-enter Password',
                      controller: provider.confirmPasswordController,
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: blueColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 0.7.h,horizontal: 14.w),
                        child: Text(
                          'Submit',
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
        ),
      ),
    );
  }
}
