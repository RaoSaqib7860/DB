import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/get_store_info_model.dart';
import '../Models/social_model.dart';

class GetAndUpdateStoreProvider extends ChangeNotifier{

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
  /// social Link Controller
  TextEditingController fbController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController ytController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

  String? selectedCurrencyName;
  String? shopValue;
  String? payment;
  String? selectLang;
  int? shopValueIndex;
  bool? loading = false;
  bool? loadingSocial = false;
  GetStoreInfoModel? getStoreInfoModel;
  GetSocialLinkModel? getSocialLinkModel;
  bool storeInfoLoading = false;
  bool storeLocationLoading = false;
  XFile? logoImage;
  ImagePicker pickerLogo = ImagePicker();
  XFile? favImage;
  ImagePicker favLogo = ImagePicker();
  //GetStoreInfoApi

  Future updateStoreInfoApi() async {
    storeInfoLoading = true;
    update_state();
    var data = await DataProvider().stor_info_api(map: {
      'user_id': '${user_model.data!.userId}',
      'shop_name': '${storeNameController.text}',
      'shop_description': '${storeDiscriptionController.text}',
      'store_email': '${notificationController.text}',
      'order_prefix': '${orderIdController.text}',
      'currency_position': '${selectedCurrencyName}',
      'currency_name': '${currencyNameController.text}',
      'currency_icon': 'Rs',
      'shop_type': '${shopValueIndex}',
      'tax': '${taxController.text}',
      'order_receive_method': '${payment}',
      'lanugage[]': '${selectLang}',
      'domain_id': '${user_model.data!.domainId}'
    });
    update_state();
    print('objectis${user_model.data!.userId}');
    storeInfoLoading = false;
    update_state();
  }
  Future storeLocationApi() async {
    storeLocationLoading = true;
    update_state();
    await DataProvider().stor_location_api(map: {
      'user_id': '${user_model.data!.userId}',
      'company_name': '${companyNameController.text}',
      'address': '${addressController.text}',
      'city': '${cityController.text}',
      'state': '${stateController.text}',
      'zip_code': '${zipCodeController.text}',
      'email': '${emailController.text}',
      'phone': '${phoneController.text}',
      'invoice_description': '${invoiceController.text}',
    });
    update_state();
    print('objectis${user_model.data!.userId}');
    storeLocationLoading = false;
    update_state();
  }

  getStoreInformation({Map<String, dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().GetStoreInfoApi(map:{
      'user_id': '${user_model.data!.userId}',
    });
    getStoreInfoModel = data;
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  getAndUpdateSocialLink({Map<String, dynamic>? map}) async {
    loadingSocial = true;
    update_state();
    var data = await DataProvider().updateSocialLinkApi(map:map);
    getSocialLinkModel = data;
    print('objectis${user_model.data!.userId}');
    loadingSocial = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}