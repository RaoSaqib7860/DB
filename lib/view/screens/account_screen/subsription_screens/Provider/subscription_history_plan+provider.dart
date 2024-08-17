import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Model/get_order_history_plan.dart';
import '../Model/subscription_plan_history.dart';


class GetSubscriptionPlanProvider extends ChangeNotifier{


  bool? loading = false;
  GetSubscriptionPlanHistoryModel? getSubscriptionPlanHistoryModel;
  GetSubscriptionOrderHistoryModel? getSubscriptionOrderHistoryModel;

  getSubscriptionHistoryApiFunction({Map<String, dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().getSubscriptionHistoryApi(map:{
      'user_id': '${user_model.data!.userId}',
    });
    getSubscriptionPlanHistoryModel = data;
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }
  getOrderSubscriptionHistory({Map<String, dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().getOrderSubscriptionHistoryApi(map:{
      'user_id': '${user_model.data!.userId}',
    });
    getSubscriptionOrderHistoryModel = data;
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}