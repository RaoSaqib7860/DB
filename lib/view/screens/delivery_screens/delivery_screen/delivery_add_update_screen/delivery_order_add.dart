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
import '../../models/tcs_information_model.dart';

class DeliveryOrderAdd extends StatefulWidget {
  const DeliveryOrderAdd({super.key});

  @override
  State<DeliveryOrderAdd> createState() => _DeliveryOrderAddState();
}

class _DeliveryOrderAddState extends State<DeliveryOrderAdd> {
  var items = ['0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.0'];
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
    setState(() {});
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
                      Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/back_arrow.svg',
                                height: 2.h,
                                color: Colors.black,
                              )),
                        ],
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
                          hint: 'Customer full name'),
                      CustomFormField(
                          controller: customer_address_controller,
                          name: 'Customer Address',
                          hint: 'Customer complete address`'),
                      CustomFormField(
                          controller: customer_phone_controller,
                          name: 'Customer Cell #',
                          hint: 'Customer mobile number'),
                      CustomFormField(
                          controller: customer_email_controller,
                          name: 'Customer Email',
                          hint: 'Customer register email address'),
                      CustomFormField(
                          controller: item_title_controller,
                          name: 'Item',
                          hint: 'Item title'),
                      CustomFormField(
                        name: 'Sending City',
                        hint: 'Karachi',
                        controller: sendingg_city_controller,
                      ),
                      CustomFormField(
                          controller: receiving_city_controller,
                          name: 'Receiving City',
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
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
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
