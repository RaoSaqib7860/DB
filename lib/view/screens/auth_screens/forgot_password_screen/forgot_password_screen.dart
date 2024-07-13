import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../confirm_password_screen/confirm_password_screen.dart';
import 'Forget Provider/foget_provider.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ForgetOtpProvider provider = Provider.of<ForgetOtpProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: CustomContainer(
          widgets: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
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
                    'Forgot Password',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    'Enter your Email or Number below and we will\n     send you a link to reset your Password.',
                    style: TextStyle(
                      fontSize: 11.sp
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomTextField(
                      hintText: 'Email or number',
                      controller: provider.emailController,
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  GestureDetector(
                    onTap: () async{
                       //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPasswordScreen(),));
                       await provider.forget_api(context);
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
