import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/cupertino_alert_dialog.dart';
import '../../../../custom_widgets/custom_form_field.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../order_screens/all_order_screens/all_order_detail_screen.dart';
import '../povider/delivery_provider.dart';
import 'delivery_add_update_screen/delivery_order_add.dart';
import 'delivery_detail.dart';
import 'delivery_order_screens/tcs_screen.dart';

class DeliveryOrderScreen extends StatefulWidget {
  const DeliveryOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryOrderScreen> createState() => _DeliveryOrderScreenState();
}

class _DeliveryOrderScreenState extends State<DeliveryOrderScreen> {
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';
  int ind = 0;

  @override
  void initState() {
    get_data();
    super.initState();
  }

  get_data() async {
    final DeliveryProvider provider =
        Provider.of<DeliveryProvider>(context, listen: false);
    await provider.delivery_ordersApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    order_loading = false;
    setState(() {});
  }

  bool order_loading = true;
  @override
  Widget build(BuildContext context) {
    final DeliveryProvider provider = Provider.of<DeliveryProvider>(context);
    return DataLoading(
      isLoading: order_loading,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 3.5.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Row(
                        children: [
                          Container(
                            height: 3.h,
                            width: 33.w,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 1.w),
                                child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 2.h,
                                    color: Colors.black,
                                  ),
                                  value: dropdownvalue,
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                  hint: Text(
                                    "Font Family",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 7.sp, color: Colors.white),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeliveryDetail(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.5.w, vertical: 0.7.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pick up address for',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7.sp,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              SvgPicture.asset(
                                'assets/svgs/tcs.svg',
                                height: 1.3.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: order_loading
                    ? SizedBox()
                    : RefreshIndicator(
                        onRefresh: () async {
                          await provider.delivery_ordersApi(map: {
                            'user_id': '${user_model.data!.userId}',
                          });
                        },
                        child: ListView.builder(
                          itemCount: provider.deliveryOrders?.data?.length ?? 0,
                          padding: EdgeInsets.only(bottom: 12.h),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AllOrderDetailScreen(
                                        orderId:
                                            '${provider.deliveryOrders?.data?[index].orderid}',
                                      ),
                                    ));
                              },
                              child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Colors.grey.withAlpha(50),
                                                offset: Offset(1, 1),
                                                spreadRadius: 1,
                                                blurRadius: 2),
                                            BoxShadow(
                                                color:
                                                    Colors.grey.withAlpha(50),
                                                offset: Offset(-1, -1),
                                                spreadRadius: 1,
                                                blurRadius: 2),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "ID : ${provider.deliveryOrders?.data?[index].id}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11.sp),
                                                ),
                                                Text(
                                                  "${provider.deliveryOrders?.data?[index].result}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 8.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //SizedBox(height: 0.5.h,),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.5.h),
                                                  child: Text(
                                                    "${provider.deliveryOrders?.data?[index].consigneeName}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff005493),
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  '${provider.deliveryOrders?.data?[index].codAmount}',
                                                  style: TextStyle(
                                                      color: redColor,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${provider.deliveryOrders?.data?[index].consigneeMobNo}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                                Container(
                                                  color: Color(0xffF0C9D0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w,
                                                            vertical: 0.2.h),
                                                    child: Text(
                                                      '${provider.deliveryOrders?.data?[index].orderdatetime}',
                                                      style: TextStyle(
                                                          color: redColor,
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            Text(
                                              '${provider.deliveryOrders?.data?[index].originCityName}',
                                              style: TextStyle(
                                                  color: Color(0xff9B001E),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //SizedBox(height: 1.h,),
                                            Divider(
                                              thickness: 0.8,
                                              color: Color(0xff707070),
                                            ),
                                            SizedBox(
                                              height: 0.1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'To : ${provider.deliveryOrders?.data?[index].destinationCityName}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      show_cupertinoDialog(
                                                          context: context,
                                                          title: 'Delete',
                                                          subtitle:
                                                              'Are you sure you want to delete?',
                                                          no_subtitle: 'No',
                                                          yes_title: "Yes",
                                                          on_done: () {
                                                            DataProvider()
                                                                .tcs_remove_ordersApi(
                                                                    map: {
                                                                  'user_id':
                                                                      user_model
                                                                          .data!
                                                                          .id
                                                                          .toString(),
                                                                  'method':
                                                                      'delete',
                                                                  'order_ids[]': provider
                                                                      .deliveryOrders
                                                                      ?.data?[
                                                                          index]
                                                                      .id
                                                                      .toString()
                                                                });
                                                            provider
                                                                .deliveryOrders!
                                                                .data
                                                                ?.removeAt(
                                                                    index);
                                                            setState(() {});
                                                          });
                                                    },
                                                    child: const Icon(
                                                      CupertinoIcons.delete,
                                                      color: Colors.red,
                                                    )),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 0.7)),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w, right: 1.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Detail',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 9.sp,
                                                            //fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          size: 2.h,
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ))
            ],
          ),
          Positioned(
            bottom: 2.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (c) => DeliveryOrderAdd(),
                          fullscreenDialog: true))
                      .then((value) async {
                    var data = await DataProvider().delivery_ordersApi(map: {
                      'user_id': '${user_model.data!.userId}',
                    });
                    provider.deliveryOrders = data;
                    setState(() {});
                  });
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
                      'Create Delivery (COD)',
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
    );
  }
}
