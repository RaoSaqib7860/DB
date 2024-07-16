import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/all_order_model.dart';

class AllOrderProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  TextEditingController searchController= TextEditingController();
  bool loading = false;
  AllOrderModel? allOrderModel;
  get_order_data() async{
    loading = true;
    update_state();
    var data= await DataProvider().allOrderModelApi(map: {
      'user_id' : '${user_model.data!.userId}',
      'type' : 'all',
      //'src' : '',
     // 'payment_status' : '1',
      //'status' : '1',
      //'start' : '1',
      //'end' : '1',
    });
    allOrderModel=data;
    print('objectismodel${allOrderModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }
  // get_search_product_data({String? type}) async{
  //   loading = true;
  //   update_state();
  //   var data= await DataProvider().allProductModelApi(map: {
  //     'user_id' : '${user_model.data!.userId}',
  //     'type' : '1',
  //     'search' : '${type}',
  //     'page' : '1',
  //   });
  //   allProductModel=data;
  //   print('objectismodel${allProductModel!.toJson()}');
  //   update_state();
  //   print('objectis${user_model.data!.userId}');
  //   loading = false;
  //   update_state();
  // }
  update_state(){
    notifyListeners();
  }
}
