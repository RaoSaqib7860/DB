import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';

class UpdateStoreProvider extends ChangeNotifier{

  /// shop controller
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeDiscriptionController = TextEditingController();
  TextEditingController notificationController = TextEditingController();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController currencyNameController = TextEditingController();
  TextEditingController currencyIconController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  /// location controller
  TextEditingController companyNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController invoiceController = TextEditingController();
  String? selectedCurrencyName;
  String? shopValue;
  String? payment;
  String? selectLang;
  int? shopValueIndex;
  bool loading = false;
  bool storeInfoLoading = false;
  bool storeLocationLoading = false;
  XFile? logoImage;
  ImagePicker pickerLogo = ImagePicker();
  XFile? favImage;
  ImagePicker favLogo = ImagePicker();
  Future upload_logo_Image() async {
    final XFile? result = await pickerLogo.pickImage(source: ImageSource.gallery);
    if (result != null) {
      logoImage = XFile(result.path);
      update_state();
    }
  }
  Future upload_fav_Image() async {
    final XFile? result = await favLogo.pickImage(source: ImageSource.gallery);
    if (result != null) {
      favImage = XFile(result.path);
      update_state();
    }
  }

  Future post_Images_data() async {
    loading = true;
    update_state();
    var data = await DataProvider().updateStoreLogoApi(
        uploadMedia: dio.FormData.fromMap({
          'user_id': '${user_model.data!.userId}',
          'logo': await dio.MultipartFile.fromFile(logoImage!.path),
          'favicon': await dio.MultipartFile.fromFile(favImage!.path),
        }));
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }
  Future storeInfoApi() async {
    storeInfoLoading = true;
    update_state();
    var data = await DataProvider().stor_info_api(map: {
      'user_id': '${user_model.data!.userId}',
     // 'lanugage[]': '${user_model.data!.userId}',
      //'local': '${user_model.data!.userId}',
      'tax': '${taxController.text}',
      'shop_type': '${shopValue}',
     // 'domain_id': '${user_model.data!.userId}',
      'shop_name': '${storeNameController.text}',
      'shop_description': '${storeDiscriptionController.text}',
      'store_email': '${notificationController.text}',
      'order_prefix': '#${orderIdController.text}',
      'currency_position': '${selectedCurrencyName!.toLowerCase()}',
      //'currency_name': '${currencyNameController.text}',
      //'currency_icon': '${currencyIconController.text}',
      'order_receive_method': '${payment}',
    }

    );
    update_state();
    print('objectis${user_model.data!.userId}');
    storeInfoLoading = false;
    update_state();
  }
  Future storeLocationApi() async {
    storeLocationLoading = true;
    update_state();
    var data = await DataProvider().stor_location_api(map: {
      'user_id': '${user_model.data!.userId}',
      'company_name': '${companyNameController.text}',
      'address': '${addressController.text}',
      'city': '${cityController.text}',
      'state': '${stateController.text}',
      'zip_code': '${zipCodeController.text}',
      'email': '${emailController.text}',
      'phone': '${phoneController.text}',
      'invoice_description': '${invoiceController.text}',
    }

    );
    update_state();
    print('objectis${user_model.data!.userId}');
    storeLocationLoading = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}