import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../utils_services/storage_util.dart';
import '../view/screens/Brands/Brands Model/brand_model.dart';
import '../view/screens/account_screen/analytic_screen/Model/analytics_model.dart';
import '../view/screens/account_screen/analytic_screen/Model/get_order_history_model.dart';
import '../view/screens/account_screen/store_setting_screen/Models/get_store_info_model.dart';
import '../view/screens/account_screen/store_setting_screen/Models/social_model.dart';
import '../view/screens/account_screen/subsription_screens/Model/get_order_history_plan.dart';
import '../view/screens/account_screen/subsription_screens/Model/subscription_plan_history.dart';
import '../view/screens/auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../view/screens/auth_screens/login_screen/Model/login_model.dart';
import '../view/screens/delivery_screens/models/delivery_cost_model.dart';
import '../view/screens/delivery_screens/models/delivery_location_model.dart';
import '../view/screens/delivery_screens/models/delivery_order_model.dart';
import '../view/screens/delivery_screens/models/store_info_model.dart';
import '../view/screens/delivery_screens/models/tcs_information_model.dart';
import '../view/screens/home_screen/Models/dashboard_model.dart';
import '../view/screens/home_screen/Models/store_status_model.dart';
import '../view/screens/order_screens/Models/all_order_model.dart';
import '../view/screens/order_screens/Models/order_info_model.dart';
import '../view/screens/product_screens/Models/all_product_model.dart';
import '../view/screens/product_screens/Models/brand_product_model.dart';
import '../view/screens/product_screens/Models/category_product_model.dart';
import '../view/screens/product_screens/Models/edit_product_model.dart';
import '../view/screens/product_screens/Models/edit_product_price_model.dart';
import '../view/screens/product_screens/Models/update_inventory_model.dart';
import '../view/screens/product_screens/Models/update_product_image_model.dart';
import '../view/screens/product_screens/Models/update_product_seo_model.dart';
import 'base_path.dart';

class DataProvider {
  var headers = {'csrf': '5574499YmRzanYyZzExa2J3Y3N1b2Y='};
  Future loginFunction(
      {Map<String, dynamic>? map, BuildContext? context}) async {
    final response = await http.post(Uri.parse('$baseURL$userLogin'),
        body: map, headers: headers);
    print('objectnamwb${response.body} ');
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      user_model = LoginModel.fromJson(data);
      if (user_model.data!.accountStatus == 2) {
        showDialog(
            context: context!,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text("Account Suspend"),
                  content: const Text(
                    "Account Suspend please contact us \n support@dialoxx.com",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text("Contact US"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
        return null;
      }

      if (user_model.data!.accountStatus == 3) {
        showDialog(
            context: context!,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text("Account in pending mode"),
                  content: const Text(
                    "Mode And Also Disabled All Functionality If You Are Not Complete Your Payment Please Complete Your Payment From",
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
        return null;
      }

      log("loginFunction code is = ${response.statusCode}");
      storage.write('userData', user_model.toJson());
      print('objectnamw${user_model.data!.userId} ');
      Get.snackbar('Success', '${data['message']}');
      return user_model;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future<bool> forgetOtpSendFunction({Map<String, dynamic>? map}) async {
    final response = await http.post(
      Uri.parse('$baseURL$forgetOtpSendUrl'),
      body: map,
    );
    var data = jsonDecode(response.body);
    print('${data}');
    if (data['success'] == 'OTP sent successfully') {
      Get.snackbar('Success', '${data['success']}');
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return false;
    }
  }

  Future<bool> verifyOtpSendFunction({Map<String, dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$verifyOtpSendUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    print('${data}');
    if (data['status'] == 200) {
      return true;
    } else {
      Get.snackbar('Alert', '${data['success']}');
      return false;
    }
  }

  Future<bool> resetPasswordFunction({Map<String, dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$resetPasswordUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    print('result...$data');
    if (data['result'] == 'success') {
      Get.snackbar('Success', '${data['message']}');
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return false;
    }
  }

  Future signUpApi({Map<String, dynamic>? map}) async {
    try {
      print('map is === $map');
      final response = await http.post(Uri.parse('$baseURL$signupUrl'),
          body: map, headers: headers);
      print('signUpApi responce ... ${response}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar('Success', '${data['message']}');
        return true;
      } else {
        Map map = data['errors'];
        Get.snackbar('Alert', '${map.values.first}');
        return null;
      }
    } catch (e) {
      print('exception....${e}');
    }
  }

  Future getHome({String? userId}) async {
    DashBoardModel? dashBoardModel;
    final response = await http.post(Uri.parse('$baseURL$dashBoardUrl'),
        body: {'user_id': userId}, headers: headers);
    print('the data is user id == ${userId}');
    var data = jsonDecode(response.body);
    log("status code is ${data}");
    return data;
  }

  Future storeOnOffApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$storeOnOffUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    print('${data}');
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future allProductModelApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    AllProductModel? allProductModel;
    final response = await http.post(Uri.parse('$baseURL$productScreenUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      allProductModel = AllProductModel.fromJson(data);
      return allProductModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future allBrandsApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    AllBrandsModel? allBrandsModel;
    final response = await http.post(Uri.parse('$baseURL$brandsScreenUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      allBrandsModel = AllBrandsModel.fromJson(data);
      return allBrandsModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future allOrderModelApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    AllOrderModel? allOrderModel;
    final response = await http.post(Uri.parse('$baseURL$ordersScreenUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      allOrderModel = AllOrderModel.fromJson(data);
      return allOrderModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future updateProductApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    UpdateProductModel? updateProductModel;
    final response = await http.post(Uri.parse('$baseURL$updateProductInfoUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      updateProductModel = UpdateProductModel.fromJson(data);
      return updateProductModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future updateInventoryProductApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    UpdateInventoryProduct? updateInventoryProduct;
    final response = await http.post(
        Uri.parse('$baseURL$updateInventoryProductInfoUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      updateInventoryProduct = UpdateInventoryProduct.fromJson(data);
      return updateInventoryProduct;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }
  Future updateSocialLinkApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetSocialLinkModel? getSocialLinkModel;
    final response = await http.post(
        Uri.parse('$baseURL$updateAndGetSocialUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getSocialLinkModel = GetSocialLinkModel.fromJson(data);
      return getSocialLinkModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }
  Future getAnalyticsApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetAnalyticsModel? getAnalyticsModel;
    final response = await http.post(
        Uri.parse('$baseURL$storeAnalyticsUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getAnalyticsModel = GetAnalyticsModel.fromJson(data);
      return getAnalyticsModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }
  Future getOrderHistoryApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetOrserHistoryModel? getOrserHistoryModel;
    final response = await http.post(
        Uri.parse('$baseURL$getOrderHistoryUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getOrserHistoryModel = GetOrserHistoryModel.fromJson(data);
      return getOrserHistoryModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }
  Future getSubscriptionHistoryApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetSubscriptionPlanHistoryModel? getSubscriptionPlanHistoryModel;
    final response = await http.post(
        Uri.parse('$baseURL$getSubscriptionHistoryUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getSubscriptionPlanHistoryModel = GetSubscriptionPlanHistoryModel.fromJson(data);
      return getSubscriptionPlanHistoryModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }
  Future getOrderSubscriptionHistoryApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetSubscriptionOrderHistoryModel? getSubscriptionOrderHistoryModel;
    final response = await http.post(
        Uri.parse('$baseURL$getOrderSubscriptionHistoryUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getSubscriptionOrderHistoryModel = GetSubscriptionOrderHistoryModel.fromJson(data);
      return getSubscriptionOrderHistoryModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future updateProductPriceApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    UpdateProductPriceModel? updateProductPriceModel;
    final response = await http.post(
        Uri.parse('$baseURL$updateProductPriceInfoUrl'),
        body: map,
        headers: headers);
    log("updateProductPriceApi...... ${response.body}");
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      updateProductPriceModel = UpdateProductPriceModel.fromJson(data);
      return updateProductPriceModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future updateProductSEOApi({Map<String, dynamic>? map,bool? update=false}) async {
    print('map is === $map');
    UpdateProductSEOModel? updateProductSEOModel;
    final response = await http.post(
        Uri.parse('$baseURL$updateProductSEOInfoUrl'),
        body: map,
        headers: headers);
    if(update==false){
      var data = jsonDecode(response.body);
      if (data['result'] == 'success') {
        log("loginFunction code is = ${response.statusCode}");
        updateProductSEOModel = UpdateProductSEOModel.fromJson(data);
        return updateProductSEOModel;
      } else {
        Get.snackbar('Alert', '${data['message']}');
        return null;
      }
    }
  }
  Future GetStoreInfoApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    GetStoreInfoModel? getStoreInfoModel;
    final response = await http.post(
        Uri.parse('$baseURL$getStoreInfoUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      getStoreInfoModel = GetStoreInfoModel.fromJson(data);
      return getStoreInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future update_Image_api({dio.FormData? uploadMedia}) async {
    try {
      print('objectmapis${uploadMedia}');
      UpdateProductImageModel? updateProductImageModel;
      final response = await dio.Dio().post(
          '$baseURL$updateProductImageInfoUrl',
          data: uploadMedia,
          options: dio.Options(headers: headers));
      var data = response.data;
      updateProductImageModel = UpdateProductImageModel.fromJson(data);
      print('Add Product result data =$data');
      return updateProductImageModel;
    } catch (e) {
      print('exceptionn..${e}');
    }
  }

  Future updateStoreLogoApi({dio.FormData? uploadMedia}) async {
    print('objectmapis${uploadMedia}');
    final response = await dio.Dio().post('$baseURL$storeLogoUrl',
        data: uploadMedia, options: dio.Options(headers: headers));
    var data = response.data;
    print('Add LOOOO$data');
    if (data['result'] == 'success') {
      Get.snackbar('Success', '${data['message']}');
    }
    return data;
  }

  Future domain_request_api({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$domain_request'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    print('$data');
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      Get.snackbar('Success', '${data['message']}');
    } else {
      Get.snackbar('Alert', '${data['message']}');
    }
  }

  Future stor_info_api({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$store_info'),
        body: map, headers: headers);
    print('${response.body}');
    var data = jsonDecode(response.body);
    print('$data');
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      Get.snackbar('Success', '${data['message']}');
    } else {
      Get.snackbar('Alert', '${data['message']}');
    }
  }

  Future stor_location_api({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$store_location'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    print('$data');
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      Get.snackbar('Success', '${data['message']}');
    } else {
      Get.snackbar('Alert', '${data['message']}');
    }
  }

  Future addProductApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$addProductScreenUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      Get.snackbar('Success', '${data['message']}');
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return false;
    }
  }

  Future updateOrderApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$updateOrderInfoUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");

      Get.snackbar('Success', '${data['message']}');
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return false;
    }
  }

  Future getUpdateOrderApi({Map<String, dynamic>? map}) async {
    print('map is ===ghj $map');
    final response = await http.post(
        Uri.parse('$baseURL$getupdateOrderInfoUrl'),
        body: map,
        headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");

      Get.snackbar('Success', '${data['message']}');
      return true;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return false;
    }
  }

  Future orderInfoApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    OrderInfoModel? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$orderInfoUrl'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      orderInfoModel = OrderInfoModel.fromJson(data);
      return orderInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future getstore_infoApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    StoreInfoModel? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$getstore_info'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      orderInfoModel = StoreInfoModel.fromJson(data);
      return orderInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future get_categoriesApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    CateoryProductModel? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$get_categories'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      orderInfoModel = CateoryProductModel.fromJson(data);
      return orderInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future get_brandsApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    BrandsProductModel? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$get_brands'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      orderInfoModel = BrandsProductModel.fromJson(data);
      return orderInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future delivery_ordersApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    DeliveryOrders? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$delivery_orders'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      orderInfoModel = DeliveryOrders.fromJson(data);
      return orderInfoModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future delivery_locationApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    DeliveryLocationModel? deliveryLocationModel;
    final response = await http.post(Uri.parse('$baseURL$delivery_location'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      deliveryLocationModel = DeliveryLocationModel.fromJson(data);
      return deliveryLocationModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future check_logoApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    StoreStatusModel? storeStatusModel;
    final response = await http.post(Uri.parse('$baseURL$check_logo'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("check_logoApi code is = ${data}");
    storeStatusModel = StoreStatusModel.fromJson(data);
    return storeStatusModel;
  }

  Future delivery_costApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    DeliveryCostModel? deliveryLocationModel;
    final response = await http.post(Uri.parse('$baseURL$delivery_method'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      deliveryLocationModel = DeliveryCostModel.fromJson(data);
      return deliveryLocationModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future tcs_infoApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    TCSInformationModel? tcsInformationModel;
    final response = await http.post(Uri.parse('$baseURL$tcs_info'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = ${data}");
    if (data['result'] == 'success') {
      tcsInformationModel = TCSInformationModel.fromJson(data);
      return tcsInformationModel;
    } else {
      Get.snackbar('Alert', '${data['message']}');
      return null;
    }
  }

  Future delivery_locationApi_crud({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$delivery_location'),
        body: map, headers: headers);
    log("loginFunction code is = ${response.body}");
  }

  Future delivery_costApi_crud({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$delivery_method'),
        body: map, headers: headers);
    log("loginFunction code is = ${response.body}");
  }

  Future order_status_updateApi({Map<String, dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$order_status_update'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = $data");
  }

  Future tcs_remove_ordersApi({Map<String, dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$tcs_remove_orders'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("loginFunction code is = $data");
  }

  Future tcs_deliveryApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$tcs_delivery'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("tcs_deliveryApi code is = $data");
    if (data['result'] == 'Failed') {
      Get.snackbar('Alert', '${data['message']}');
    }
    if (data['result'] == 'success') {
      Get.snackbar('Alert', '${data['message']}\n${data['data']}');
    }
  }

  Future remove_images_productApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    await http.post(Uri.parse('$baseURL$remove_images_product'),
        body: map, headers: headers);
  }

  Future add_paymentgatewayApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$add_paymentgateway'),
        body: map, headers: headers);
    var data = jsonDecode(response.body);
    log("add_paymentgatewayApi code is = $data");
    if (data['result'] == 'Failed') {
      Get.snackbar('Alert', '${data['message']}');
    }
    if (data['result'] == 'success') {
      Get.snackbar('Alert', '${data['message']}\n${data['data']}');
      return true;
    }
  }
}
