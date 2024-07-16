import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../bottom_sheet/bottom_sheet.dart';
import '../../../store_setup_screen/store_setup_screen.dart';
import '../Model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;
  //int index = 1;
  final formKey = GlobalKey<FormState>();
  bool isPasswordShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? validate_email_phone(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    return emailValid;
  }

  String? validate_password(String? value) {
    if (value!.length < 10) {
      return 'Password must be more than 8 character';
    } else {
      return null;
    }
  }

  login_api(BuildContext? context) async {
    try {
      loading = true;
      updateState();
      LoginModel? result = await DataProvider().loginFunction(map: {
        'email': emailController.text,
        'password': passwordController.text,
      });
      print('object11111');
      loading = false;
      updateState();
      Navigator.pushReplacement(
          context!,
          MaterialPageRoute(
            builder: (context) => BottomSheetScreen(),
          ));
      // if (result != null) {
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
