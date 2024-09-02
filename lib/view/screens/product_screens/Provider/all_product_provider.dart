import 'package:db_2_0/view/screens/product_screens/Models/all_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/brand_product_model.dart';
import '../Models/category_product_model.dart';

class AllProductProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  bool loading = true;
  bool category_loading = true;
  bool brands_loading = true;
  AllProductModel? allProductModel;
  CateoryProductModel? cateoryProductModel;
  BrandsProductModel? brandsProductModel;
  String dropdownvalue = 'All Products';
  int index = 1;
  dynamic map_data;
  Future get_product_data({Map<String, dynamic>? map}) async {
    loading = true;
    update_state();
    map_data=map;
    var data = await DataProvider().allProductModelApi(map: map);
    allProductModel = data;
    print('objectismodel${allProductModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  get_categories({Map<String, dynamic>? map}) async {
    category_loading = true;
    update_state();
    var data = await DataProvider().get_categoriesApi(map: map);
    cateoryProductModel = data;
    print('objectis${user_model.data!.userId}');
    category_loading = false;
    update_state();
  }

  get_brands({Map<String, dynamic>? map}) async {
    brands_loading = true;
    update_state();
    var data = await DataProvider().get_brandsApi(map: map);
    brandsProductModel = data;
    print('objectis${user_model.data!.userId}');
    brands_loading = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}
