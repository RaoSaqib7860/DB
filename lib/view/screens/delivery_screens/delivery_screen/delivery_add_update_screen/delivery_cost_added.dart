import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../../../custom_widgets/app_colors.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../models/delivery_cost_model.dart' as cost;
import '../../models/delivery_location_model.dart';
import '../../models/delivery_location_model.dart' as location;

class DeliveryCostAdded extends StatefulWidget {
  dynamic CostModel;
  DeliveryCostAdded({super.key, this.CostModel});

  @override
  State<DeliveryCostAdded> createState() => _DeliveryCostAddedState();
}

class _DeliveryCostAddedState extends State<DeliveryCostAdded> {
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  location.Data? dropdownvalue;
  int ind = 0;
  cost.Data? data;
  TextEditingController delivery_method_controller = TextEditingController();
  TextEditingController delivery_cost_controller = TextEditingController();
  @override
  void initState() {
    data = widget.CostModel;
    if (data == null) {
      data = cost.Data(relations: [], name: '', price: '');
    }
    if (data != null) {
      delivery_method_controller.text = data?.name ?? '';
      delivery_cost_controller.text = data?.price ?? '';
    }
    get_data();
    super.initState();
  }

  DeliveryLocationModel? deliveryLocationModel;
  get_data() async {
    var data = await DataProvider().delivery_locationApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    deliveryLocationModel = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: deliveryLocationModel == null,
      child: Scaffold(
        body: deliveryLocationModel == null
            ? SizedBox()
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5.w,
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
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          'Create Shipping Method'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                              fontSize: 12.sp),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          'Delivery Method'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withAlpha(170),
                              fontSize: 10.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          height: 3.h,
                          child: TextField(
                            controller: delivery_method_controller,
                            style:
                                TextStyle(fontSize: 10.sp, color: Colors.black),
                            decoration: InputDecoration(
                                hintText: 'Type here'.tr,
                                hintStyle: TextStyle(fontSize: 10.sp),
                                contentPadding: EdgeInsets.only(bottom: 1.6.h)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          'Delivery Cost'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withAlpha(170),
                              fontSize: 10.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Container(
                          height: 3.h,
                          child: TextField(
                            controller: delivery_cost_controller,
                            style:
                                TextStyle(fontSize: 10.sp, color: Colors.black),
                            decoration: InputDecoration(
                                hintText: 'Type here',
                                hintStyle: TextStyle(fontSize: 10.sp),
                                contentPadding: EdgeInsets.only(bottom: 1.6.h)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          'Delivery Location'.tr,
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
                            value: dropdownvalue,
                            items: deliveryLocationModel!.data!
                                .map((location.Data items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items.name!,
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: Colors.black.withAlpha(170)),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              dropdownvalue = newValue;
                              int index = data!.relations!.indexWhere(
                                  (element) =>
                                      element.relationId == dropdownvalue!.id);
                              if (index == -1) {
                                data?.relations?.add(cost.Relations(
                                    name: '${dropdownvalue?.name}',
                                    relationId: dropdownvalue?.id));
                              }
                              setState(() {});
                            },
                            hint: Text(
                              "Select Location".tr,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Wrap(
                          spacing: 5,
                          children: data!.relations!.map((e) {
                            return Chip(
                              label: Text(
                                '${e.name}',
                                style: TextStyle(fontSize: 11),
                              ),
                              visualDensity: VisualDensity.comfortable,
                              onDeleted: () {
                                data!.relations!.remove(e);
                                setState(() {});
                              },
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 2.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: GestureDetector(
                        onTap: () async {
                          if (data!.id == null) {
                            List value = [];
                            data?.relations!.forEach((element) {
                              value.add(element.relationId.toString());
                            });
                            await DataProvider().delivery_costApi_crud(map: {
                              'user_id': '${user_model.data!.userId}',
                              'method': 'add',
                              'title': delivery_method_controller.text,
                              'price': delivery_cost_controller.text,
                              'locations[]': value.join(',')
                            });
                            Get.snackbar(
                                'Success', 'Method Added Successfully!');
                          } else {
                            List value = [];
                            data?.relations!.forEach((element) {
                              value.add(element.relationId.toString());
                            });
                            await DataProvider().delivery_costApi_crud(map: {
                              'user_id': '${user_model.data!.userId}',
                              'method': 'edit',
                              'method_id': data?.id.toString(),
                              'title': delivery_method_controller.text,
                              'price': delivery_cost_controller.text,
                              'locations[]': value.join(',')
                            });
                            Get.snackbar(
                                'Success', 'Method Updated Successfully!');
                          }
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Save'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
