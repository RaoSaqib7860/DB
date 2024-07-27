import 'package:flutter/material.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../models/dashboard_model.dart';

class HomePageProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  bool loading = false;
  DashBoardModel? dashboardModel;
  dynamic values;
  get_dashboard_data() async{
    print('objectis${user_model.data!.userId}');
    loading = true;
    update_state();
    var data= await DataProvider().getHome(userId: user_model.data!.userId.toString());
    dashboardModel=DashBoardModel.fromJson(data);
    print('objectis${dashboardModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
     values = double.parse('${dashboardModel!.data!.storageUsed}').toStringAsFixed(2);
    loading = false;
    update_state();
  }
  update_state(){
    notifyListeners();
  }
}
