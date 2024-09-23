import 'package:flutter/material.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../models/delivery_cost_model.dart';
import '../models/delivery_location_model.dart';
import '../models/delivery_order_model.dart';

class DeliveryProvider extends ChangeNotifier {
  DeliveryOrders? deliveryOrders;
  DeliveryLocationModel? deliveryLocationModel;
  DeliveryCostModel? deliveryCostModel;

  Future delivery_ordersApi({Map<String, String>? map}) async {
    var data = await DataProvider().delivery_ordersApi(map: map);
    deliveryOrders = data;
    update_state();
  }

  Future delivery_locationApi({Map<String, String>? map}) async {
    var data = await DataProvider().delivery_locationApi(map: map);
    deliveryLocationModel = data;
    update_state();
  }

  Future delivery_costApi({Map<String, String>? map}) async {
    var data = await DataProvider().delivery_costApi(map: map);
    deliveryCostModel = data;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}
