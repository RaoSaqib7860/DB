import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils_services/storage_util.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import '../../../store_setup_screen/store_setup_screen.dart';
import '../Model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;
  //int index = 1;
  final formKey = GlobalKey<FormState>();
  bool isPasswordShow = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? validate_email_phone(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    return emailValid;
  }

  String? validate_password(String? value) {
    if (value!.length < 10) {
      return 'Password must be more than 8 character'.tr;
    } else {
      return null;
    }
  }

  login_api({BuildContext? context, bool? is_email}) async {
    try {
      loading = true;
      updateState();
      var result = await DataProvider().loginFunction(map: {
        'email': is_email == true ? emailController.text : phoneController.text,
        'password': passwordController.text,
      }, context: context);
      loading = false;
      updateState();
      LoginModel? loginModel = result;
      storage.write('email',
          is_email == true ? emailController.text : phoneController.text);
      storage.write('password', passwordController.text);
      if (result != null) {
        if (loginModel!.data!.isProduct == 1 &&
            loginModel.data!.isPaymentMethod == 1) {
          Get.offAll(BottomSheetScreen());
        } else {
          Get.to(StoreSetupScreen());
        }
      }
    } catch (e) {
      loading = false;
      print('error is ==== $e');
      updateState();
    }
  }

  updateState() {
    notifyListeners();
  }
}
