import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils_services/storage_util.dart';
import '../view/screens/auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../view/screens/auth_screens/login_screen/Model/login_model.dart';
import '../view/screens/home_screen/Models/dashboard_model.dart';
import '../view/screens/order_screens/Models/all_order_model.dart';
import '../view/screens/order_screens/Models/order_info_model.dart';
import '../view/screens/product_screens/Models/all_product_model.dart';
import 'base_path.dart';

class DataProvider{

  Future loginFunction({Map<String , dynamic>? map}) async {
    //String? deviceId = await getId();
    print('objectnamwp${map} ');
    final response = await http.post(Uri.parse('$baseURL$userLogin'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    print('objectnamwb${response.body} ');
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      user_model = LoginModel.fromJson(data);
      log("loginFunction code is = ${response.statusCode}");
      storage.write('userData', user_model.toJson());
      print('objectnamw${user_model.data!.userId} ');
      // snackBarFailer('${data['message']}');
      Get.snackbar('Success','${data['message']}');
      return user_model;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }
  Future<bool> forgetOtpSendFunction({Map<String , dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$forgetOtpSendUrl'),body: map, );
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return false;
    }
  }
  Future<bool> verifyOtpSendFunction({Map<String , dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$verifyOtpSendUrl'),body: map, );
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return false;
    }
  }
  Future<bool> resetPasswordFunction({Map<String , dynamic>? map}) async {
    final response = await http.post(Uri.parse('$baseURL$resetPasswordUrl'),body: map, );
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return false;
    }
  }

  Future signUpApi({Map<String , dynamic>? map}) async {
    //String? deviceId = await getId();
   // LoginModel? loginModel = LoginModel();
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$signupUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'Success') {
      //loginModel = LoginModel.fromJson(data);
      log("loginFunction code is = ${response.statusCode}");
      // user_model = LoginModel.fromJson(data);
      // storage.write('userData', user_model.toJson());
      // snackBarFailer('${data['message']}');
      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }

  Future getHome({String? userId}) async {
    DashBoardModel? dashBoardModel;
    final response = await http.post(
      Uri.parse('$baseURL$dashBoardUrl'),
        body: {
        'user_id' : userId
    },
        headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    print('the data is user id == ${userId}');
    var data = jsonDecode(response.body);
    log("status code is ${data}");
    return data;
  }

  Future storeOnOffApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$storeOnOffUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'Success') {
      log("loginFunction code is = ${response.statusCode}");
      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }
  Future allProductModelApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    AllProductModel? allProductModel;
    final response = await http.post(Uri.parse('$baseURL$productScreenUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      allProductModel = AllProductModel.fromJson(data);
      //log("data code is = ${allProductModel.toJson()}");
      Get.snackbar('Success','${data['message']}');
      return allProductModel;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }
  Future allOrderModelApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    AllOrderModel? allOrderModel;
    final response = await http.post(Uri.parse('$baseURL$ordersScreenUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      allOrderModel = AllOrderModel.fromJson(data);
      //log("data code is = ${allProductModel.toJson()}");
      Get.snackbar('Success','${data['message']}');
      return allOrderModel;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }
  Future addProductApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$addProductScreenUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");

      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return false;
    }
  }
  Future updateOrderApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    final response = await http.post(Uri.parse('$baseURL$updateOrderInfoUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");

      Get.snackbar('Success','${data['message']}');
      return true;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return false;
    }
  }
  Future orderInfoApi({Map<String , dynamic>? map}) async {
    print('map is === $map');
    OrderInfoModel? orderInfoModel;
    final response = await http.post(Uri.parse('$baseURL$orderInfoUrl'), body: map,headers: {
      'csrf' : '5574499YmRzanYyZzExa2J3Y3N1b2Y='
    });
    var data = jsonDecode(response.body);
    if (data['result'] == 'success') {
      log("loginFunction code is = ${response.statusCode}");
      orderInfoModel = OrderInfoModel.fromJson(data);
      Get.snackbar('Success','${data['message']}');
      return orderInfoModel;
    }else{
      Get.snackbar('Alert','${data['message']}');
      return null;
    }
  }

}