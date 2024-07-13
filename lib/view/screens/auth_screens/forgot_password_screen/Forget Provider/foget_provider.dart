import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:flutter/material.dart';

import '../../../store_setup_screen/store_setup_screen.dart';
import '../../confirm_password_screen/confirm_password_screen.dart';
import '../otp_screen.dart';

class ForgetOtpProvider extends ChangeNotifier {
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  bool isPasswordShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  forget_api(BuildContext? context) async {
    try {
      loading = true;
      updateState();
      bool? result = await DataProvider().forgetOtpSendFunction(map: {
        'email': emailController.text,
      });
      print('object11111');
      loading = false;
      updateState();
      Navigator.push(context!, MaterialPageRoute(builder: (context) => OtpScreens(
        email: emailController.text,
      ),));
      // if (result == true) {
      //   print('object222222');
      //
      // }
    } catch (e) {
      loading = false;
      print('error is ==== $e');
      updateState();
    }
    // if (formKey.currentState!.validate()){
    //
    // }
  }

  verify_Otp_api(BuildContext? context) async {
    try {
      loading = true;
      updateState();
      bool? result = await DataProvider().verifyOtpSendFunction(map: {
        'email': emailController.text,
        'otp': otpController.text,
      });
      print('object11111');
      loading = false;
      updateState();
      Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ConfirmPasswordScreen(),
          ));
      // if (result == true) {
      //   print('object222222');
      //
      // }
    } catch (e) {
      loading = false;
      print('error is ==== $e');
      updateState();
    }
    // if (formKey.currentState!.validate()){
    //
    // }
  }


  reset_password_api(BuildContext? context) async {
    try {
      loading = true;
      updateState();
      bool? result = await DataProvider().resetPasswordFunction(map: {
        'new_password': passwordController.text,
        'confirm_password': confirmPasswordController.text,
        'email': emailController.text,
      });
      print('object11111');
      loading = false;
      updateState();
      Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ConfirmPasswordScreen(),
          ));
      // if (result == true) {
      //   print('object222222');
      //
      // }
    } catch (e) {
      loading = false;
      print('error is ==== $e');
      updateState();
    }
    // if (formKey.currentState!.validate()){
    //
    // }
  }

  updateState() {
    notifyListeners();
  }
}
