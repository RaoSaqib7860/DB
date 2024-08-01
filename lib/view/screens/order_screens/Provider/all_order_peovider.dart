import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/custom_toast.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/all_order_model.dart';
import '../Models/order_info_model.dart';

class AllOrderProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  TextEditingController searchController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController zipController= TextEditingController();
  TextEditingController addressController= TextEditingController();
  bool loading = false;
  AllOrderModel? allOrderModel;
  OrderInfoModel? orderInfoModel;
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
  get_order_detail_data({String? orderId}) async{
    loading = true;
    update_state();
    var data= await DataProvider().orderInfoApi(map: {
      'user_id' : '${user_model.data!.userId}',
      'order_id' : '${orderId}',

    });
    orderInfoModel=data;
    print('objectismodel${orderInfoModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }
  update_order_detail_data({String? orderId,BuildContext? context}) async{
    loading = true;
    update_state();
    var data= await DataProvider().updateOrderApi(map: {
      'order_id' : '${orderId}',
      'name' : '${nameController.text}',
      'email' : '${emailController.text}',
      'phone' : '${phoneController.text}',
      'address' : '${addressController.text}',
      'zip_code' : '${zipController.text}',

    });
    if(data == true){
      CustomToastManager.showToast(
          context: context,
          height: 8.h,
          width: 60.w,
          message: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  SizedBox(width: 5.w,),
                  SvgPicture.asset('assets/svgs/pro_toast.svg',height: 4.h,),
                  SizedBox(width: 5.w,),
                  Text(
                    'Order Updated',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          )
      );
      Navigator.pop(context!);
      loading = false;
      update_state();
    }else{
      loading = false;
      update_state();
    }

  }
  update_state(){
    notifyListeners();
  }
}
