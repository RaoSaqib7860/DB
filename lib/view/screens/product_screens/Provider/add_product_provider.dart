import 'dart:io';
import 'package:db_2_0/view/screens/Brands/Brands%20Model/brand_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../api_repository/api_utils.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/category_product_model.dart';
import '../Models/edit_product_model.dart';
import '../Models/edit_product_price_model.dart';
import '../Models/update_product_image_model.dart';
import '../Models/update_product_seo_model.dart';

class AddProductProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool value = false;
  bool loading = false;
  UpdateProductModel? updateProductModel;
  UpdateProductPriceModel? updateProductPriceModel;
  UpdateProductImageModel? updateProductImageModel;
  UpdateProductSEOModel? updateProductSEOModel;
  AllBrandsModel? allBrandsModel;
  CateoryProductModel? cateoryProductModel;
  File? profileImage;
  ImagePicker picker = ImagePicker();
  Future upload_Image() async {
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      profileImage = File(result.path);
      update_state();
    }
  }

  add_product_data() async {
    loading = true;
    update_state();
    var data = await DataProvider().addProductApi(map: {
      'user_id': '${user_model.data!.userId}',
      'title': '${nameController.text}',
      'price': '${priceController.text}',
      'price_type': '1',
      //'stock_manage' : '',
      //'stock_qty' : '',
    });
    loading = false;
    update_state();
  }

  Future update_product_data({String? productId}) async {
    //current_api_object = map;
    loading = true;
    update_state();
    var data = await DataProvider().updateProductApi(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
    });
    updateProductModel = data;
    print('objectismodel${updateProductModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future update_price_product_data({String? productId}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateProductPriceApi(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
    });
    updateProductPriceModel = data;
    print('objectismodel${updateProductPriceModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future update_SEO_product_data({String? productId}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateProductSEOApi(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
    });
    updateProductSEOModel = data;
    print('objectismodel${updateProductSEOModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future update_Image_product_data({String? productId}) async {
    loading = true;
    update_state();
    var data = await DataProvider().update_Image_api(
        uploadMedia: FormData.fromMap({
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
      //'media[]' : await MultipartFile.fromFile(profileImage!.path),
    }));
    updateProductImageModel = data;

    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future get_brands_data() async {
    loading = true;
    update_state();
    var data = await DataProvider().allBrandsApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    allBrandsModel = data;
    print('objectismodel${allBrandsModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future get_categories_data() async {
    loading = true;
    update_state();
    var data = await DataProvider().get_categoriesApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    cateoryProductModel = data;
    print('objectismodel${cateoryProductModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  update_state() {
    notifyListeners();
  }
}
