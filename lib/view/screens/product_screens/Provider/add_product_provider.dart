import 'package:db_2_0/view/screens/product_screens/Models/all_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';

class AddProductProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool value = false;
  bool loading = false;
  add_product_data() async{
    loading = true;
    update_state();
    var data= await DataProvider().addProductApi(map: {
      'user_id' : '${user_model.data!.userId}',
      'title' : '${nameController.text}',
      'price' : '${priceController.text}',
      'price_type' : '1',
      //'stock_manage' : '',
      //'stock_qty' : '',
    });
    loading = false;
    update_state();
  }
  update_state(){
    notifyListeners();
  }
}
