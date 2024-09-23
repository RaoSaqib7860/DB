import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Model/analytics_model.dart';
import '../Model/get_order_history_model.dart';


class GetAnalyticsProvider extends ChangeNotifier{
  GetAnalyticsModel? getAnalyticsModel;
  GetOrserHistoryModel? getOrserHistoryModel;

  Map<String, String> payment_status = {
    '1': 'Complete',
    '2': 'Pending',
    '3': 'Incomplete',
    '4': 'Cancel'
  };

  getAnalyticsApiFunction({Map<String, dynamic>? map}) async {
    var data = await DataProvider().getAnalyticsApi(map:{
      'user_id': '${user_model.data!.userId}',
      'domain_id': '${user_model.data!.domainId}'
    });
    getAnalyticsModel = data;
    print('objectis${user_model.data!.userId}');
    update_state();
  }
  getOrderHistoryFunction({Map<String, dynamic>? map}) async {
    var data = await DataProvider().getOrderHistoryApi(map:{
      'user_id': '${user_model.data!.userId}',
      'domain_id': '${user_model.data!.domainId}'
    });
    getOrserHistoryModel = data;
    print('objectis${user_model.data!.userId}');
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}