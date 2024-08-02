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
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool loading = false;
  bool loading_details = false;
  bool outer_loader = false;
  AllOrderModel? allOrderModel;
  OrderInfoModel? orderInfoModel;

  Map<String, dynamic>? current_api_object = {};

  Map<String, String> payment_status = {
    '1': 'Complete',
    '2': 'Pending',
    '3': 'Incomplete',
    '4': 'Cancel'
  };
  Map<String, String> typeOrder = {
    'All Orders': 'all',
    'Awaiting Processing': 'pending',
    'Processing': 'processing',
    'Ready For Pickup': 'ready-for-pickup',
    'Completed': 'completed',
    'Archived': 'archived',
    'Canceled': 'canceled',
  };

  Map<String, String> payment_status_map = {
    'Pending': '2',
    'Complete': '1',
    'Incomplete': '3',
    'Cancel': '4'
  };

  Map<String, String> full_fill_payment_status_map = {
    'Pending': 'pending',
    'Processing': 'processing',
    'Ready For Pickup': 'ready-for-pickup',
    'Completed': 'completed',
    'Archived': 'archived',
    'Canceled': 'canceled',
  };

  Map<String, String> full_fill_payment_status_map_revers = {
    'pending': 'Pending',
    'processing': 'Processing',
    'ready-for-pickup': 'Ready For Pickup',
    'completed': 'Completed',
    'archived': 'Archived',
    'canceled': 'Canceled',
  };

  Future get_order_data({Map<String, dynamic>? map}) async {
    current_api_object = map;
    loading = true;
    update_state();
    var data = await DataProvider().allOrderModelApi(map: map);
    allOrderModel = data;
    print('objectismodel${allOrderModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading = false;
    update_state();
  }

  get_order_detail_data({String? orderId}) async {
    loading_details = true;
    update_state();
    var data = await DataProvider().orderInfoApi(map: {
      'user_id': '${user_model.data!.userId}',
      'order_id': '${orderId}',
    });
    orderInfoModel = data;
    print('objectismodel${orderInfoModel!.toJson()}');
    update_state();
    print('objectis${user_model.data!.userId}');
    loading_details = false;
    update_state();
  }

  update_order_detail_data({String? orderId, BuildContext? context}) async {
    loading = true;
    update_state();
    var data = await DataProvider().updateOrderApi(map: {
      'order_id': '${orderId}',
      'name': '${nameController.text}',
      'email': '${emailController.text}',
      'phone': '${phoneController.text}',
      'address': '${addressController.text}',
      'zip_code': '${zipController.text}',
    });
    if (data == true) {
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
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Order Updated',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ));
      Navigator.pop(context!);
      loading = false;
      update_state();
    } else {
      loading = false;
      update_state();
    }
  }

  update_state() {
    notifyListeners();
  }
}
