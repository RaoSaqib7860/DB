import 'dart:io';
import 'package:db_2_0/view/screens/Brands/Brands%20Model/brand_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/custom_toast.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/category_product_model.dart';
import '../Models/edit_product_model.dart';
import '../Models/edit_product_price_model.dart';
import '../Models/update_inventory_model.dart';
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
  UpdateInventoryProduct? updateInventoryProduct;
  File? profileImage;
  ImagePicker picker = ImagePicker();
  Future upload_Image() async {
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      profileImage = File(result.path);
      update_state();
    }
  }
String? selectedPage = 'Product';
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
  get_update_product_data({Map<String,dynamic>? map,BuildContext? context}) async {
    loading = true;
    update_state();
    var data = await DataProvider().getUpdateOrderApi(map: map).then((value){
      CustomToastManager.showToast(
          context: context,
          height: 8.h,
          width: 60.w,
          message: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset(
                    'assets/svgs/pro_toast.svg',
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Changes saved\nsuccessfully',
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black,
                        height: 0.16.h,
                        fontWeight:
                        FontWeight.w500),
                  ),
                ],
              ),
            ),
          ));
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

  Future update_price_product_data({Map<String,dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateProductPriceApi(map: map);
    updateProductPriceModel = data;
    print('objectismodel${updateProductPriceModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  Future update_SEO_product_data({Map<String,dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateProductSEOApi(map: map);
    updateProductSEOModel = data;
    print('objectismodel${updateProductSEOModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }
  Future update_Inventory_ProductApi({Map<String,dynamic>? map}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateInventoryProductApi(map: map);
    updateInventoryProduct = data;
    print('objectismodel${updateInventoryProduct!.toJson()}');
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
