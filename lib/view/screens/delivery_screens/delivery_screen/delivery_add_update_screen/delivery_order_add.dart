import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_form_field.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../../order_screens/Models/all_order_model.dart';
import '../../../order_screens/Models/all_order_model.dart' as all_order;
import '../../../order_screens/Models/order_info_model.dart';
import '../../models/store_info_model.dart';
import '../../models/tcs_information_model.dart';

class DeliveryOrderAdd extends StatefulWidget {
  const DeliveryOrderAdd({super.key});

  @override
  State<DeliveryOrderAdd> createState() => _DeliveryOrderAddState();
}

class _DeliveryOrderAddState extends State<DeliveryOrderAdd> {
  var items = ['0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.0 above'];
  var items_prices = [0, 150, 200, 250, 350, 550, 2500];
  String? dropdownvalue;
  int ind = 0;

  TextEditingController cost_center_code_controller = TextEditingController();
  TextEditingController customer_name_controller = TextEditingController();
  TextEditingController customer_address_controller = TextEditingController();
  TextEditingController customer_phone_controller = TextEditingController();
  TextEditingController customer_email_controller = TextEditingController();
  TextEditingController sendingg_city_controller = TextEditingController();
  TextEditingController receiving_city_controller = TextEditingController();
  TextEditingController no_item_controller = TextEditingController();
  TextEditingController cod_ammount_controller = TextEditingController();
  TextEditingController item_title_controller = TextEditingController();
  TextEditingController customer_reference_no_controller =
      TextEditingController();
  TextEditingController any_comments_controller = TextEditingController();

  @override
  void initState() {
    get_orders();
    super.initState();
  }

  AllOrderModel? allOrderModel;
  all_order.Orders? selected_order;
  TCSInformationModel? tcsInformationModel;
  get_orders() async {
    var data = await DataProvider().allOrderModelApi(map: {
      'user_id': '${user_model.data!.userId}',
      'type': 'all',
    });
    allOrderModel = data;
    tcsInformationModel = await DataProvider().tcs_infoApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    StoreInfoModel? storeInfoModel =
        await DataProvider().getstore_infoApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    sendingg_city_controller.text =
        storeInfoModel?.data?.info?.costCenterCity ?? '';
    setState(() {});
  }

  OrderInfoModel? orderInfoModel;

  get_odrder_details({int? orderId}) async {
    var data = await DataProvider().orderInfoApi(map: {
      'user_id': '${user_model.data!.userId}',
      'order_id': '$orderId',
    });
    orderInfoModel = data;
    customer_name_controller.text =
        orderInfoModel?.orderData?.orderContent?.value?.name ?? '';
    customer_address_controller.text =
        orderInfoModel?.orderData?.orderContent?.value?.address ?? '';
    customer_phone_controller.text =
        orderInfoModel?.orderData?.orderContent?.value?.phone ?? '';
    customer_email_controller.text =
        orderInfoModel?.orderData?.orderContent?.value?.email ?? '';
    ///
    receiving_city_controller.text =
        orderInfoModel?.orderData?.shippingInfo?.city?.name ?? '';
    no_item_controller.text =
        orderInfoModel?.orderData?.orderItem?.first.qty.toString() ?? '';
    cod_ammount_controller.text =
        orderInfoModel?.orderData?.total.toString() ?? '';

    ///
    item_title_controller.text =
        orderInfoModel?.orderData?.orderItem?.first.term?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: allOrderModel == null,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: allOrderModel == null
              ? SizedBox()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 7.h,
                        width: 100.w,
                        color: blueColor,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 4.h,
                                            width: 10.w,
                                            child: Center(
                                              child: SvgPicture.asset(
                                                'assets/svgs/back_arrow.svg',
                                                height: 3.h,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                    ],
                                  )),
                              Text(
                                'Create Delivery'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomFormField(
                          enable: false,
                          name: 'Cost Center Code',
                          hint:
                              '${tcsInformationModel?.data?.first.costCenterCode}'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          'Order #',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withAlpha(170),
                              fontSize: 10.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          child: DropdownButton(
                            isExpanded: true,
                            underline: Padding(
                              padding: EdgeInsets.only(bottom: 0.2.h),
                              child: Container(
                                color: Colors.grey,
                                height: 0.1.h,
                                width: 100.w,
                              ),
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 2.5.h,
                              color: Colors.grey,
                            ),
                            value: selected_order,
                            items: allOrderModel!.data!.orders!
                                .map((all_order.Orders items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items.orderNo!,
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.black.withAlpha(170)),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selected_order = newValue!;
                              });
                              get_odrder_details(orderId: selected_order!.id);
                            },
                            hint: const Text(
                              "Select Order number",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomFormField(
                          controller: customer_name_controller,
                          name: 'Customer Name',
                          enable: false,
                          hint: 'Customer full name'),
                      CustomFormField(
                          controller: customer_address_controller,
                          name: 'Customer Address',
                          enable: false,
                          hint: 'Customer complete address`'),
                      CustomFormField(
                          controller: customer_phone_controller,
                          name: 'Customer Cell #',
                          enable: false,
                          hint: 'Customer mobile number'),
                      CustomFormField(
                          controller: customer_email_controller,
                          name: 'Customer Email',
                          enable: false,
                          hint: 'Customer register email address'),
                      CustomFormField(
                          controller: item_title_controller,
                          name: 'Item',
                          enable: false,
                          hint: 'Item title'),
                      CustomFormField(
                        name: 'Sending City',
                        hint: 'Karachi',
                        enable: false,
                        controller: sendingg_city_controller,
                      ),
                      CustomFormField(
                          controller: receiving_city_controller,
                          name: 'Receiving City',
                          enable: false,
                          hint: 'Receiving to city'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item Weight',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withAlpha(170),
                                        fontSize: 10.sp),
                                  ),
                                  Container(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline: Padding(
                                        padding: EdgeInsets.only(bottom: 0.2.h),
                                        child: Container(
                                          color: Colors.grey,
                                          height: 0.1.h,
                                          width: 100.w,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 2.5.h,
                                        color: Colors.grey,
                                      ),
                                      value: dropdownvalue,
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            '${items}kg',
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black
                                                    .withAlpha(170)),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        print('call oect');
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                        if (items.indexOf(dropdownvalue!) !=
                                            6) {
                                          cod_ammount_controller
                                              .text = (orderInfoModel!
                                                      .orderData!.total! +
                                                  items_prices[items
                                                      .indexOf(dropdownvalue!)])
                                              .toString();
                                        } else {
                                          cod_ammount_controller.text =
                                              (orderInfoModel!
                                                          .orderData!.total! +
                                                      items_prices[6])
                                                  .toString();
                                          print('2');
                                        }
                                        print(
                                            'call oect${cod_ammount_controller.text}');
                                        setState(() {});
                                      },
                                      hint: Text(
                                        "Item Weight",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No of Items',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withAlpha(170),
                                      fontSize: 10.sp),
                                ),
                                Container(
                                  height: 3.h,
                                  child: TextField(
                                    controller: no_item_controller,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                    decoration: InputDecoration(
                                        enabled: false,
                                        hintText: 'No of Items number',
                                        hintStyle: TextStyle(fontSize: 10.sp),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 1.6.h)),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'COD Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withAlpha(170),
                                      fontSize: 10.sp),
                                ),
                                Container(
                                  height: 3.h,
                                  child: TextField(
                                    controller: cod_ammount_controller,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'COD Amount',
                                        enabled: false,
                                        hintStyle: TextStyle(fontSize: 10.sp),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 1.6.h)),
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Reference No',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withAlpha(170),
                                      fontSize: 10.sp),
                                ),
                                Container(
                                  height: 3.h,
                                  child: TextField(
                                    controller:
                                        customer_reference_no_controller,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Customer Reference No',
                                        hintStyle: TextStyle(fontSize: 10.sp),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 1.6.h)),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomFormField(
                        name: 'Remarks',
                        hint: 'Any comment',
                        controller: any_comments_controller,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: GestureDetector(
                          onTap: () async {
                            if (selected_order != null &&
                                dropdownvalue != null &&
                                customer_name_controller.text.isNotEmpty &&
                                customer_address_controller.text.isNotEmpty &&
                                customer_phone_controller.text.isNotEmpty &&
                                customer_email_controller.text.isNotEmpty &&
                                sendingg_city_controller.text.isNotEmpty &&
                                receiving_city_controller.text.isNotEmpty &&
                                no_item_controller.text.isNotEmpty &&
                                item_title_controller.text.isNotEmpty &&
                                cod_ammount_controller.text.isNotEmpty &&
                                customer_reference_no_controller
                                    .text.isNotEmpty) {
                              await DataProvider().tcs_deliveryApi(map: {
                                'user_id': user_model.data!.id.toString(),
                                'costCenterCode': tcsInformationModel
                                    ?.data?.first.costCenterCode,
                                'ordernumber': selected_order?.id.toString(),
                                'termTitle': item_title_controller.text,
                                'consigneeName': customer_name_controller.text,
                                'consigneeAddress':
                                    customer_address_controller.text,
                                'consigneeMobNo':
                                    customer_phone_controller.text,
                                'consigneeEmail':
                                    customer_email_controller.text,
                                'originCityName': sendingg_city_controller.text,
                                'destinationCityName':
                                    receiving_city_controller.text,
                                'weight': dropdownvalue,
                                'pieces': no_item_controller.text,
                                'codAmount': cod_ammount_controller.text,
                                'customerReferenceNo':
                                    customer_reference_no_controller.text,
                                'remarks': any_comments_controller.text
                              });
                            } else {
                              Get.snackbar('Alert',
                                  'Fields is missing.Please fill up all fields.');
                            }
                          },
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
