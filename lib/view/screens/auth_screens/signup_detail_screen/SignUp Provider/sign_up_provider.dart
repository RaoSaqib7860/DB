import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import '../../login_screen/Model/login_model.dart';
import '../../login_screen/login_screen.dart';

class SignUpProvider extends ChangeNotifier {
  bool loading = false;
  //int index = 1;
  final formKey = GlobalKey<FormState>();
  bool isPasswordShow = false;
  int? index;
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  List list_of_category = [
    'Fashion Apparels, Garments & Clothing Accessories'.tr,
    'Restaurant, Bakery & Coffee Shops'.tr,
    'Mobile, Computers & Electronics'.tr,
    'Books & Stationary Goods'.tr,
    'Jewellery, Gold & Accessories'.tr,
    'Home Decoration & Electronic Appliances'.tr,
    'Fruits, Vegetables & Agriculture Products'.tr,
    'Hardware & Construction Tools'.tr,
    'Local & Online Services'.tr,
    'Kiryana Store, FMCG & Grocery'.tr,
    'Pharmacy & Medical Care'.tr,
    'Transportation, Car Rental, Travel & Tourism'.tr,
    'Insurance & Financial Services'.tr,
    'Car, Bike, Tractor & Vehicle Accessories'.tr,
    'Real Estate Services'.tr,
    'Pet Accessories & Services'.tr,
    'Toys & Kids Accessories'.tr,
    'Wholesalers & Manufactures'.tr,
    'Beauty Cosmetic & Personal Care'.tr
  ];

  // List list_of_images = [
  //   'cloth',
  //   'shop',
  //   'mobile',
  //   'book',
  //   'gold',
  //   'deco',
  //   'fruit',
  //   'tools',
  //   'services',
  //   'kiryana',
  //   'pharmacy',
  //   'cars',
  //   'insurance',
  //   'accessories',
  //   'real_estate',
  //   'pet',
  //   'toy',
  //   'wholesaler',
  //   'beauty_care'
  // ];
  String? selected_categgory;
  bool? checkboxSelected = false;

  String dropdownvalue = 'Select business industry'.tr;

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

  sign_up_api(BuildContext? context) async {
    print('object index of = ${index}');
    try {
      loading = true;
      updateState();
      var result = await DataProvider().signUpApi(map: {
        'email': emailController.text,
        'name': businessNameController.text,
        'password': passwordController.text,
        'business_industory': '1',
        'domain': domainController.text,
        'country': 'Pakistan',
        'category': '${list_of_category.indexOf(selected_categgory) + 1}',
        'mobile': mobileController.text
      });
      print('result is ==== ${result}');
      loading = false;
      updateState();
      if (result == true) {
        // await DataProvider().loginFunction(map: {
        //   'email': emailController.text,
        //   'password': passwordController.text,
        // });
        Get.offAll(LoginScreen());
      }
    } catch (e) {
      loading = false;
      updateState();
    }
  }

  updateState() {
    notifyListeners();
  }
}
