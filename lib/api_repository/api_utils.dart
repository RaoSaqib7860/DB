import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils_services/storage_util.dart';
import '../view/screens/auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../view/screens/auth_screens/login_screen/Model/login_model.dart';
import '../view/screens/delivery_screens/models/delivery_cost_model.dart';
import '../view/screens/delivery_screens/models/delivery_location_model.dart';
import '../view/screens/delivery_screens/models/delivery_order_model.dart';
import '../view/screens/delivery_screens/models/tcs_information_model.dart';
import '../view/screens/home_screen/Models/dashboard_model.dart';
import '../view/screens/order_screens/Models/all_order_model.dart';
import '../view/screens/order_screens/Models/order_info_model.dart';
import '../view/screens/product_screens/Models/all_product_model.dart';
import '../view/screens/product_screens/Models/brand_product_model.dart';
import '../view/screens/product_screens/Models/category_product_model.dart';
import 'base_path.dart';

class DataProvider {
  var headers = {'csrf': '5574499YmRzanYyZzExa2J3Y3N1b2Y='};
  Future loginFunction({Map<String, dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$userLogin'),
        body: map, headers: headers);
    print('objectnamwb${response.body} ');
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      user_model = LoginModel.fromJson(data);
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

  Future addProductApi({Map<String, dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$addProductScreenUrl'),
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
    if(data['result']=='Failed'){
      Get.snackbar('Alert', '${data['message']}');
    }
  }
}
