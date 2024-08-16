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

class PricingScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const PricingScreen({this.index, Key? key, this.productId}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  TextEditingController priceController = TextEditingController();
  TextEditingController regPriceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController sDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  bool _value = false;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  String discountType = 'Fixed';
  @override
  void initState() {
    api_call();
    super.initState();
  }

  String? inDate;
  api_call() async {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context, listen: false);
    await provider.update_price_product_data(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${widget.productId}',
    });
    priceController.text =
        provider.updateProductPriceModel?.data?.price?.price.toString() ?? '0';
    regPriceController.text = provider
            .updateProductPriceModel?.data?.price?.regularPrice
            .toString() ??
        '0';
    sDateController.text =
        provider.updateProductPriceModel?.data?.price?.startingDate ?? '';
    endDateController.text =
        provider.updateProductPriceModel?.data?.price?.endingDate ?? '';
    discountController.text = provider
            .updateProductPriceModel?.data!.price?.specialPrice
            ?.toString() ??
        '0';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);

    return DataLoading(
      isLoading: provider.pricing_loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: provider.updateProductPriceModel == null
              ? SizedBox()
              : Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLineTextField(
                            name: 'Current Price',
                            hint: '3500',
                            enable: false,
                            controller: priceController),
                        CustomLineTextField(
                            name: 'Regular Price',
                            hint: '4000',
                            controller: regPriceController),
                        CustomLineTextField(
                          name: 'Discounted Type',
                          hint: '$discountType',
                          enable: false,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomLineTextField(
                            name: 'Discounted Amount',
                            hint: '500',
                            controller: discountController),
                        CustomLineTextField(
                            onClick: () {
                              _showDialog(
                                CupertinoDatePicker(
                                  //initialDateTime: sDateController,
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  onDateTimeChanged: (DateTime newDate) {
                                    String d = newDate.toString();
                                    var splitDate = d.split(" ");
                                    sDateController.text = splitDate[0];
                                    //error_date = false;
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            readOnly: true,
                            name: 'Special Price Start',
                            hint: 'Date',
                            controller: sDateController),
                        CustomLineTextField(
                            onClick: () {
                              _showDialog(
                                CupertinoDatePicker(
                                  //initialDateTime: sDateController,
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  onDateTimeChanged: (DateTime newDate) {
                                    String d = newDate.toString();
                                    var splitDate = d.split(" ");
                                    endDateController.text = splitDate[0];
                                    //error_date = false;
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            readOnly: true,
                            name: 'Special Price End',
                            hint: 'Date',
                            controller: endDateController),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await provider
                                      .update_price_product_data(map: {
                                    'user_id': '${user_model.data!.userId}',
                                    'product_id': '${widget.productId}',
                                    'price': '${regPriceController.text}',
                                    'update': '1',
                                    'special_price':
                                        '${discountController.text}',
                                    'pstatus': '1',
                                    'price_type': '1',
                                    'special_price_start':
                                        '${sDateController.text}',
                                    'special_price_end':
                                        '${endDateController.text}',
                                    'special_id':
                                        '${provider.updateProductPriceModel!.data!.price!.id}',
                                  });
                                  CustomToastManager.showToast(
                                      context: context,
                                      height: 8.h,
                                      width: 60.w,
                                      message: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                      'Save Changes',
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
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        )
                        //SizedBox(height: 4.h,)
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 316,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
