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

  bool order_loading = false;
  bool location_loading = false;
  bool cost_loading = false;

  Future delivery_ordersApi({Map<String, String>? map}) async {
    order_loading = true;
    update_state();
    var data = await DataProvider().delivery_ordersApi(map: map);
    deliveryOrders = data;
    order_loading = false;
    update_state();
  }

  Future delivery_locationApi({Map<String, String>? map}) async {
    location_loading = true;
    update_state();
    var data = await DataProvider().delivery_locationApi(map: map);
    deliveryLocationModel = data;
    location_loading = false;
    update_state();
  }

  Future delivery_costApi({Map<String, String>? map}) async {
    cost_loading = true;
    update_state();
    var data = await DataProvider().delivery_costApi(map: map);
    deliveryCostModel = data;
    cost_loading = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}
