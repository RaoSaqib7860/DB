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
    'Fashion Apparels, Garments & Clothing Accessories',
    'Restaurant, Bakery & Coffee Shops',
    'Mobile, Computers & Electronics',
    'Books & Stationary Goods',
    'Jewellery, Gold & Accessories',
    'Home Decoration & Electronic Appliances',
    'Fruits, Vegetables & Agriculture Products',
    'Hardware & Construction Tools',
    'Local & Online Services',
    'Kiryana Store, FMCG & Grocery',
    'Pharmacy & Medical Care',
    'Transportation, Car Rental, Travel & Tourism',
    'Insurance & Financial Services',
    'Car, Bike, Tractor & Vehicle Accessories',
    'Real Estate Services',
    'Pet Accessories & Services',
    'Toys & Kids Accessories',
    'Wholesalers & Manufactures',
    'Beauty Cosmetic & Personal Care'
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

  String dropdownvalue = 'Select business industry';

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
        await DataProvider().loginFunction(map: {
          'email': emailController.text,
          'password': passwordController.text,
        });
        Get.offAll(BottomSheetScreen());
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
