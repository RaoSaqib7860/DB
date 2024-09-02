import 'dart:convert';

import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_model_globle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_toast.dart';
import '../Provider/all_order_peovider.dart';
import 'edit_shipping_address_screen.dart';

class AllOrderDetailScreen extends StatefulWidget {
  String? orderId;
  AllOrderDetailScreen({Key? key, this.orderId}) : super(key: key);

  @override
  State<AllOrderDetailScreen> createState() => _AllOrderDetailScreenState();
}

class _AllOrderDetailScreenState extends State<AllOrderDetailScreen> {
  @override
  void initState() {
    final AllOrderProvider provider =
        Provider.of<AllOrderProvider>(context, listen: false);
    provider.get_order_detail_data(orderId: widget.orderId);
    super.initState();
  }

  bool notify = false;
  @override
  Widget build(BuildContext context) {
    final AllOrderProvider provider = Provider.of<AllOrderProvider>(context);
    return DataLoading(
      isLoading: provider.loading_details || provider.outer_loader,
      child: Scaffold(
        body: provider.loading_details
            ? SizedBox()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 7.h,
                      width: 100.w,
                      color: blueColor,
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/svgs/back_arrow.svg',
                                  height: 2.h,
                                )),
                            SizedBox(
                              width: 24.w,
                            ),
                            Text(
                              'Order ${provider.orderInfoModel?.orderData?.orderNo}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Product'.tr,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            '${provider.orderInfoModel?.orderData?.orderItem?.first.term?.title}',
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            '${provider.orderInfoModel?.orderData?.shippingInfo?.shippingMethod?.name}',
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Amount'.tr,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          customText(
                                              text:
                                                  '${provider.orderInfoModel?.orderData?.orderItem!.first.amount} × ${provider.orderInfoModel?.orderData?.orderItem!.first.qty}'),
                                          customText(text: 'Shipping Fee'.tr),
                                          customText(text: 'Tax'.tr),
                                          customText(text: 'Discount'.tr),
                                          customText(text: 'Subtotal'.tr),
                                          Text(
                                            'Total'.tr,
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Total'.tr,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          customText(
                                              text:
                                                  'Rs${(provider.orderInfoModel?.orderData?.orderItem?.first.amount ?? 0) * (provider.orderInfoModel?.orderData?.orderItem?.first.qty ?? 0)}'),
                                          customText(
                                              text:
                                                  'Rs${provider.orderInfoModel!.orderData?.shipping}'),
                                          customText(
                                              text:
                                                  'Rs${provider.orderInfoModel!.orderData!.tax ?? 0.0}'),
                                          customText(
                                              text:
                                                  'Rs${provider.orderInfoModel!.orderData?.orderContent?.value?.couponDiscount ?? 0.0}'),
                                          customText(
                                              text:
                                                  'Rs${provider.orderInfoModel!.orderData?.orderContent?.value?.subTotal ?? 0}'),
                                          Text(
                                            'Rs${provider.orderInfoModel!.orderData!.total}',
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          visualDensity: VisualDensity(
                                              horizontal: 0, vertical: 0),
                                          value: notify,
                                          activeColor: blueColor,
                                          onChanged: (v) {
                                            notify = !notify;
                                            setState(() {});
                                            DataProvider().orderInfoApi(map: {
                                              'user_id':
                                                  '${user_model.data!.id}',
                                              'order_id': '${widget.orderId}',
                                              'mail_notify': '1'
                                            });
                                          }),
                                      Text(
                                        'Notify to customer'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xffA0A0A0))),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 0.1.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: DropdownButton(
                                              isExpanded: true,
                                              underline: Container(),
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                size: 2.h,
                                                color: Colors.black,
                                              ),
                                              value:
                                                  '${provider.payment_status['${provider.orderInfoModel!.orderData!.paymentStatus}']}',
                                              items: provider
                                                  .payment_status.values
                                                  .map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items.tr,
                                                    style: TextStyle(
                                                        fontSize: 9.sp,
                                                        color: Colors.black),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (String? newValue) async {
                                                provider.outer_loader = true;
                                                setState(() {
                                                  provider
                                                          .orderInfoModel!
                                                          .orderData!
                                                          .paymentStatus =
                                                      int.parse(provider
                                                          .payment_status_map[
                                                              newValue]
                                                          .toString());
                                                });
                                                await DataProvider()
                                                    .order_status_updateApi(
                                                        map: {
                                                      'user_id':
                                                          '${user_model.data!.id}',
                                                      'order_id':
                                                          '${widget.orderId}',
                                                      'status':
                                                          '${provider.orderInfoModel!.orderData!.status}',
                                                      'payment_status':
                                                          '${provider.orderInfoModel!.orderData!.paymentStatus}',
                                                    });
                                                var data = await DataProvider()
                                                    .orderInfoApi(map: {
                                                  'user_id':
                                                      '${user_model.data!.userId}',
                                                  'order_id':
                                                      '${widget.orderId}',
                                                });
                                                provider.orderInfoModel = data;
                                                provider.outer_loader = false;
                                                provider.update_state();
                                              },
                                              hint: Text(
                                                'Payment complete'.tr,
                                                style: TextStyle(
                                                  color: Color(0xff686868),
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 3.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                width: 1,
                                                color: Color(0xffA0A0A0))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 0.1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  underline: Container(),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    size: 2.h,
                                                    color: Colors.black,
                                                  ),
                                                  value:
                                                      '${provider.full_fill_payment_status_map_revers['${provider.orderInfoModel!.orderData!.status}']}',
                                                  items: provider
                                                      .full_fill_payment_status_map
                                                      .keys
                                                      .map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items.tr,
                                                      child: Text(
                                                        items.tr,
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) async {
                                                    setState(() {
                                                      provider
                                                              .orderInfoModel!
                                                              .orderData!
                                                              .status =
                                                          provider
                                                              .full_fill_payment_status_map[
                                                                  newValue]
                                                              .toString();
                                                    });
                                                    await DataProvider()
                                                        .order_status_updateApi(
                                                            map: {
                                                          'user_id':
                                                              '${user_model.data!.id}',
                                                          'order_id':
                                                              '${widget.orderId}',
                                                          'status':
                                                              '${provider.orderInfoModel!.orderData!.status}',
                                                          'payment_status':
                                                              '${provider.orderInfoModel!.orderData!.paymentStatus}',
                                                        });
                                                    var data =
                                                        await DataProvider()
                                                            .orderInfoApi(map: {
                                                      'user_id':
                                                          '${user_model.data!.userId}',
                                                      'order_id':
                                                          '${widget.orderId}',
                                                    });
                                                    provider.orderInfoModel =
                                                        data;
                                                    provider.update_state();
                                                  },
                                                  hint: Text(
                                                    'Payment complete',
                                                    style: TextStyle(
                                                      color: Color(0xff686868),
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              CustomToastManager.showToast(
                                                  context: context,
                                                  height: 8.h,
                                                  width: 60.w,
                                                  message: Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w),
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
                                                            'Order Updated'.tr,
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(3)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                    vertical: 0.9.h),
                                                child: Text(
                                                  'Save'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Status'.tr,
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Payment Status'.tr,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w, vertical: 0.2.h),
                                          child: Text(
                                            '${provider.payment_status['${provider.orderInfoModel!.orderData!.paymentStatus}']}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order Status'.tr,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w, vertical: 0.2.h),
                                          child: Text(
                                            '${provider.full_fill_payment_status_map_revers[provider.orderInfoModel!.orderData!.status]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Payment Mode'.tr,
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Transaction Method'.tr,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: blueColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w, vertical: 0.2.h),
                                          child: Text(
                                            '${provider.orderInfoModel!.orderData!.getway!.name}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Transaction Id'.tr,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Text(
                                        '${provider.orderInfoModel!.orderData!.transactionId}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Note'.tr,
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    '--',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Customer'.tr,
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    provider.orderInfoModel?.orderData
                                                ?.customerId ==
                                            null
                                        ? 'Guest Customer'
                                        : 'Existing Customer',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(1, 1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                  BoxShadow(
                                      color: Colors.grey.withAlpha(50),
                                      offset: Offset(-1, -1),
                                      spreadRadius: 1,
                                      blurRadius: 2),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Shipping detail'.tr,
                                    style: TextStyle(
                                        color: blueColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        detailContainer(
                                            text: 'Customer Name: '.tr +
                                                '${provider.orderInfoModel?.orderData?.orderContent?.value?.name}'),
                                        detailContainer(
                                            text: 'Customer Email: '.tr +
                                                '${provider.orderInfoModel?.orderData?.orderContent?.value?.email}'),
                                        detailContainer(
                                            text: 'Customer Phone: '.tr +
                                                '${provider.orderInfoModel?.orderData?.orderContent?.value?.phone}'),
                                        detailContainer(
                                            text: 'Location: '.tr +
                                                '${provider.orderInfoModel?.orderData?.shippingInfo?.city?.name}'),
                                        detailContainer(
                                            text: 'Zip Code: '.tr +
                                                '${provider.orderInfoModel?.orderData?.orderContent?.value?.zipCode}'),
                                        detailContainer(
                                            text: 'Address: '.tr +
                                                '${provider.orderInfoModel?.orderData?.orderContent?.value?.address}'),
                                        detailContainer(
                                            text:
                                                '${provider.orderInfoModel?.orderData?.shippingInfo?.shippingMethod?.name}'),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditShippingAddressScreen(
                                                    orderId: widget.orderId,
                                                    name:
                                                        '${provider.orderInfoModel?.orderData?.orderContent?.value?.name}',
                                                    email:
                                                        '${provider.orderInfoModel?.orderData?.orderContent?.value?.email}',
                                                    phone:
                                                        '${provider.orderInfoModel?.orderData?.orderContent?.value?.phone}',
                                                    zipCode:
                                                        '${provider.orderInfoModel?.orderData?.orderContent?.value?.zipCode}',
                                                    address:
                                                        '${provider.orderInfoModel?.orderData?.orderContent?.value?.address}',
                                                    shippingMethod:
                                                        '${provider.orderInfoModel?.orderData?.shippingInfo?.shippingMethod?.name}',
                                                  ),
                                                )).then((value) {
                                              provider.get_order_detail_data(
                                                  orderId: widget.orderId);
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: blueColor,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 0.6.h),
                                              child: Text(
                                                'Update'.tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (provider.orderInfoModel?.tcsData != null)
                            Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withAlpha(50),
                                        offset: Offset(1, 1),
                                        spreadRadius: 1,
                                        blurRadius: 2),
                                    BoxShadow(
                                        color: Colors.grey.withAlpha(50),
                                        offset: Offset(-1, -1),
                                        spreadRadius: 1,
                                        blurRadius: 2),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    detailContainer(
                                        text: 'Code Center: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.costCenterCode}'),
                                    detailContainer(
                                        text: 'Customer Name: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.consigneeName}'),
                                    detailContainer(
                                        text: 'Address: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.consigneeAddress}'),
                                    detailContainer(
                                        text: 'Mobile #: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.consigneeMobNo}'),
                                    detailContainer(
                                        text: 'Email: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.consigneeEmail}'),
                                    detailContainer(
                                        text: 'Address: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.originCityName}'),
                                    detailContainer(
                                        text: 'Destination Location: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.destinationCityName}'),
                                    detailContainer(
                                        text: 'Item weight: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.weight}/kg'),
                                    detailContainer(
                                        text: 'No of item: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.pieces}'),
                                    detailContainer(
                                        text: 'COD charges: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.codAmount}'),
                                    detailContainer(
                                        text: 'Customer Reference No: '.tr +
                                            '${provider.orderInfoModel?.tcsData?.customerReferenceNo}'),
                                    detailContainer(
                                        text:
                                            '${provider.orderInfoModel?.tcsData?.result}'),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: InkWell(
                                        onTap: () async {
                                          if (!await launchUrl(Uri.parse(
                                              'https://envio.tcscourier.com/BookingReportPDF/GenerateLabels?consingmentNumber=${provider.orderInfoModel?.tcsData?.result?.split(' ').last}'))) {
                                            throw Exception(
                                                'Could not launch ${'https://envio.tcscourier.com/BookingReportPDF/GenerateLabels?consingmentNumber=${provider.orderInfoModel?.tcsData?.result?.split(' ').last}'}');
                                          }
                                        },
                                        child: Container(
                                          decoration:
                                              BoxDecoration(color: redColor),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w,
                                                vertical: 0.5.h),
                                            child: Text(
                                              'Print Label'.tr,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.6.h,
                                    ),
                                    detailContainer(
                                        text:
                                            'Booking Date/Time: ${provider.orderInfoModel?.tcsData?.orderdatetime}'),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget customText({String? text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text!,
          style: TextStyle(fontSize: 9.sp, color: Colors.black),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  Widget detailContainer({String? text}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 0.5.h,
              width: 1.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 9.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 0.6.h)
      ],
    );
  }
}
