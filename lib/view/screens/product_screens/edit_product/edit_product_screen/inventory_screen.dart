import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';

import '../../Provider/add_product_provider.dart';

class InventoryScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const InventoryScreen({this.index, Key? key, this.productId})
      : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  TextEditingController skuController = TextEditingController();
  var manageStock = [
    'Manage Stock',
    'Dont Need to Manage Stock',
  ];
  var stockStatus = [
    'In Stock',
    'Out Of Stock',
  ];

  String? stockManage;
  String? statusStock;

  @override
  void initState() {
    api_call();
    super.initState();
  }

  String? inDate;
  api_call() async {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context, listen: false);
    provider.updateInventoryProduct = null;
    setState(() {});
    await provider.update_Inventory_ProductApi(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${widget.productId}',
    });
    skuController.text =
        provider.updateInventoryProduct?.data?.info?.stock?.sku ?? '';
    if (provider.updateInventoryProduct!.data!.info!.stock!.stockManage == 0) {
      setState(() {
        stockManage = 'Manage Stock';
      });
    } else {
      setState(() {
        stockManage = 'Dont Need to Manage Stock';
      });
    }
    if (provider.updateInventoryProduct!.data!.info!.stock!.stockStatus == 0) {
      setState(() {
        statusStock = 'In Stock';
      });
    } else {
      setState(() {
        statusStock = 'Out Of Stock';
      });
    }
    setState(() {});
  }

  int? manageStockIndex;
  int? stockStatusIndex;
  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);
    return DataLoading(
      isLoading: provider.inentory_loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    'Stock'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: CustomLineTextField(
                      name: 'SKU', hint: '#ABC-123', controller: skuController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    'Manage Stock'.tr,
                    style: TextStyle(color: Colors.black, fontSize: 10.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: DropdownButton(
                    isExpanded: true,
                    value: stockManage,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 3.h,
                      color: Colors.black,
                    ),
                    items: manageStock.map((String? items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items!,
                          style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        stockManage = newValue!;
                        manageStockIndex = manageStock.indexOf(newValue);
                      });
                    },
                    hint: Text(
                      "Select".tr,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                if (provider.updateInventoryProduct != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Container(
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
                      child: Column(
                        children: [
                          Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name / Variant'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                    Text(
                                      'Images'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                    Text(
                                      'Quantity'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              //width: 50.w,
                              height: 10.h,
                              child: ListView.builder(
                                itemCount: provider.updateInventoryProduct!
                                    .data!.stockData!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.2.h),
                                    child: Container(
                                      height: 7.h,
                                      decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 3.w, right: 6.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${provider.updateInventoryProduct!.data!.stockData![index].colorName}',
                                                style: TextStyle(
                                                    color: Color(0xff454545),
                                                    fontSize: 13.sp),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 6.w),
                                                child: Container(
                                                  height: 5.h,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                              0xff707070))),
                                                  child: Center(
                                                    child: Image.network(
                                                        fit: BoxFit.cover,
                                                        'https://${user_model.data!.domain}/${provider.updateInventoryProduct!.data!.stockData![index].colorImage}'),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${provider.updateInventoryProduct!.data!.stockData![index].quantity}',
                                                style: TextStyle(
                                                    color: Color(0xff454545),
                                                    fontSize: 13.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await provider.update_Inventory_ProductApi(map: {
                            'user_id': '${user_model.data!.userId}',
                            'product_id': '${widget.productId}',
                            'sku': '${skuController.text}',
                            'stock_manage': '${manageStockIndex}',
                            'stock_status': '${stockStatusIndex}',
                            //'stock_qty': '',
                          });
                          CustomToastManager.showToast(
                              context: context,
                              height: 8.h,
                              width: 60.w,
                              message: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
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
                                        'Changes saved\nsuccessfully'.tr,
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
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.7.w, vertical: 0.8.h),
                            child: Text(
                              'Save Changes'.tr,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 0.8.h),
                          child: Text(
                            'Next'.tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
