import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/cupertino_alert_dialog.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Provider/all_order_peovider.dart';
import '../create_order_screen.dart';
import 'all_order_detail_screen.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  void initState() {
    call_orders();
    super.initState();
  }

  call_orders() {
    final AllOrderProvider provider =
        Provider.of<AllOrderProvider>(context, listen: false);
    provider.get_order_data(
        map: {'user_id': '${user_model.data!.userId}', 'type': 'all'});
  }

  @override
  Widget build(BuildContext context) {
    final AllOrderProvider provider = Provider.of<AllOrderProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: provider.loading
                ? SizedBox()
                : provider.allOrderModel!.data!.orders!.isEmpty
                    ? Center(
                        child: Text('Order not found.'.tr),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          await provider.get_order_data(
                              map: provider.current_api_object);
                        },
                        child: ListView.builder(
                          itemCount:
                              provider.allOrderModel!.data!.orders!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AllOrderDetailScreen(
                                        orderId: provider.allOrderModel!.data!
                                            .orders![index].id
                                            .toString(),
                                      ),
                                    )).then((value) async {
                                  var data = await DataProvider()
                                      .allOrderModelApi(map: {
                                    'user_id': '${user_model.data!.userId}',
                                    'type': 'all',
                                  });
                                  provider.allOrderModel = data;
                                  setState(() {});
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Order '.tr +
                                                      '${provider.allOrderModel!.data!.orders![index].orderNo}'
                                                          .tr,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  'Items: '.tr +
                                                      '${provider.allOrderModel!.data!.orders![index].orderItemsCount}'
                                                          .tr,
                                                  style: TextStyle(
                                                    fontSize: 9.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd-MMM-yyyy').format(DateTime.parse('${provider.allOrderModel!.data!.orders![index].updatedAt}'))}',
                                                  style: TextStyle(
                                                    fontSize: 9.sp,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Customer name:'.tr,
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Color(0xff5B5B5B),
                                                  ),
                                                ),
                                                Container(
                                                  color: Color(0xffF0C9D0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w,
                                                            vertical: 0.5.h),
                                                    child: Text(
                                                      'Rs${provider.allOrderModel!.data!.orders![index].total}',
                                                      style: TextStyle(
                                                          color: redColor,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            //SizedBox(height: 1.h,),
                                            Text(
                                              '${provider.allOrderModel!.data!.orders![index].orderContent?.value?.name}',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: redColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Fulfillment:'.tr,
                                                      style: TextStyle(
                                                        fontSize: 9.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.6.w,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: provider
                                                                    .allOrderModel!
                                                                    .data!
                                                                    .orders![
                                                                        index]
                                                                    .status ==
                                                                'pending'
                                                            ? Color(0xffffc107)
                                                            : provider
                                                                        .allOrderModel!
                                                                        .data!
                                                                        .orders![
                                                                            index]
                                                                        .status ==
                                                                    'canceled'
                                                                ? redColor
                                                                : blueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 2.w,
                                                                vertical:
                                                                    0.3.h),
                                                        child: Text(
                                                          '${provider.allOrderModel!.data!.orders![index].status}',
                                                          style: TextStyle(
                                                            fontSize: 8.sp,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Payment:'.tr,
                                                      style: TextStyle(
                                                        fontSize: 9.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 0.6.w,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: blueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 2.w,
                                                                vertical:
                                                                    0.3.h),
                                                        child: Text(
                                                          '${provider.payment_status['${provider.allOrderModel!.data!.orders![index].paymentStatus}']}',
                                                          style: TextStyle(
                                                            fontSize: 8.sp,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black26,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Customer type'.tr,
                                                      style: TextStyle(
                                                        fontSize: 9.sp,
                                                        color:
                                                            Color(0xff5B5B5B),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 0.2.h,
                                                    ),
                                                    Text(
                                                      provider
                                                                  .allOrderModel!
                                                                  .data!
                                                                  .orders![
                                                                      index]
                                                                  .customerId ==
                                                              null
                                                          ? 'Guest'
                                                          : 'Existing',
                                                      style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: blueColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (provider
                                                        .allOrderModel!
                                                        .data!
                                                        .orders![index]
                                                        .status ==
                                                    'canceled')
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
                                                                  .destroyorder_api(
                                                                      map: {
                                                                    'user_id':
                                                                        user_model
                                                                            .data!
                                                                            .id
                                                                            .toString(),
                                                                    'method':
                                                                        'delete',
                                                                    'order_id': provider
                                                                        .allOrderModel!
                                                                        .data!
                                                                        .orders![
                                                                            index]
                                                                        .id
                                                                        .toString()
                                                                  });
                                                              provider
                                                                  .allOrderModel!
                                                                  .data!
                                                                  .orders!
                                                                  .removeAt(
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                              0xff707070))),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 1.w,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Details'.tr,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff858585),
                                                            fontSize: 9.sp,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.5.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right_sharp,
                                                          color: Colors.black,
                                                          size: 2.3.h,
                                                        )
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
          ),
        ],
      ),
    );
  }
}
