import 'dart:io';
import 'package:db_2_0/view/screens/Brands/Brands%20Model/brand_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as Gett;
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/custom_toast.dart';
import '../../../../utils_services/storage_util.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../auth_screens/login_screen/Model/login_model.dart';
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
  UpdateProductModel? updateProductModel;
  UpdateProductPriceModel? updateProductPriceModel;
  UpdateProductImageModel? updateProductImageModel;
  UpdateProductSEOModel? updateProductSEOModel;
  AllBrandsModel? allBrandsModel;
  CateoryProductModel? cateoryProductModel;
  UpdateInventoryProduct? updateInventoryProduct;
  List<File> profileImage = [];
  ImagePicker picker = ImagePicker();
  Future upload_Image() async {
    List<XFile> result = await picker.pickMultiImage();
    int total =
        profileImage.length + updateProductImageModel!.data!.medias!.length;
    if (result.isNotEmpty) {
      if (total + result.length <= 7) {
        for (var i in result) {
          profileImage.add(File(i.path));
        }
      } else {
        Gett.Get.snackbar('Alert', 'Kindly select less than 5 images');
      }
      update_state();
    }
  }

  String? selectedPage = 'Product';
  Future add_product_data() async {
    await DataProvider().addProductApi(map: {
      'user_id': '${user_model.data!.userId}',
      'title': '${nameController.text}',
      'price': '${priceController.text}',
      'price_type': '1',
      'stock_manage': value ? '1' : '0',
      'stock_qty': quantityController.text
    });
    var data = await storage.read('userData');
    print('${data}');
    LoginModel loginModel = LoginModel.fromJson(data);
    loginModel.data!.isProduct = 1;
    storage.write('userData', loginModel.toJson());
    update_state();
  }

  get_update_product_data(
      {Map<String, dynamic>? map, BuildContext? context}) async {
    await DataProvider().getUpdateOrderApi(map: map);
    CustomToastManager.showToast(
        context: context,
        height: 8.h,
        width: 60.w,
        message: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ));
  }

  Future update_product_data({String? productId}) async {
    var data = await DataProvider().updateProductApi(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
    });
    updateProductModel = data;
    print('objectismodel${updateProductModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future update_price_product_data({Map<String, dynamic>? map}) async {
    var data = await DataProvider().updateProductPriceApi(map: map);
    updateProductPriceModel = data;
    //print('objectismodel${updateProductPriceModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future update_SEO_product_data({Map<String, dynamic>? map,bool? update=false}) async {
    var data = await DataProvider().updateProductSEOApi(map: map,update: update);
    if(update==false){
      updateProductSEOModel = data;
    }
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future update_Inventory_ProductApi({Map<String, dynamic>? map}) async {
    print('objecupdate_Inventory_ProductApi data .....${map}');
    var data = await DataProvider().updateInventoryProductApi(map: map);
    updateInventoryProduct = data;
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future update_Image_product_data(
      {String? productId, bool? update = false}) async {
    FormData map_data = FormData.fromMap({
      'user_id': '${user_model.data!.userId}',
      'product_id': '${productId}',
    });
    if (update!) {
      for (var file in profileImage) {
        map_data.files.addAll([
          MapEntry(
              "media[]",
              await MultipartFile.fromFile(file.path,
                  filename: file.path.split('/').last)),
        ]);
      }
    }
    var data = await DataProvider().update_Image_api(uploadMedia: map_data);
    if(update==false){
      updateProductImageModel = data;
    }
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future get_brands_data() async {
    var data = await DataProvider().allBrandsApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    allBrandsModel = data;
    print('objectismodel${allBrandsModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  Future get_categories_data() async {
    var data = await DataProvider().get_categoriesApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    cateoryProductModel = data;
    print('objectismodel${cateoryProductModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
  }

  update_state() {
    notifyListeners();
  }
}
