import 'package:flutter/material.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/store_status_model.dart';
import '../home_chart.dart';
import '../models/dashboard_model.dart';

class HomePageProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  bool loading = false;
  bool outer_loading = false;
  DashBoardModel? dashboardModel;
  StoreStatusModel? storeStatusModel;
  dynamic values;
  List<ChartData>? poduct_limit_chartData = [];
  List<ChartData>? usage_storage_chartData = [];
  get_dashboard_data() async {
    poduct_limit_chartData = [];
    usage_storage_chartData = [];
    print('objectis${user_model.data!.userId}');
    loading = true;
    update_state();
    var data = await DataProvider()
        .getHome(userId: user_model.data!.userId.toString());
    dashboardModel = DashBoardModel.fromJson(data);
    poduct_limit_chartData!.add(
      ChartData('${dashboardModel!.data!.products}',
          double.parse('${dashboardModel!.data!.productLimit}')),
    );
    poduct_limit_chartData!.add(
      ChartData('${dashboardModel!.data!.productLimit}',
          double.parse('${dashboardModel!.data!.products}')),
    );
    usage_storage_chartData!.add(
      ChartData('${dashboardModel!.data!.storageUsed}',
          double.parse('${dashboardModel!.data!.storageUsed}')),
    );
    usage_storage_chartData!.add(
      ChartData('1000', double.parse('${1000}')),
    );
    print('objectis${dashboardModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    values =
        double.parse('${dashboardModel!.data!.storageUsed}').toStringAsFixed(2);
    loading = false;
    update_state();
  }

  Future check_store_status() async {
    storeStatusModel = await DataProvider()
        .check_logoApi(map: {'user_id': user_model.data!.userId.toString()});
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}
