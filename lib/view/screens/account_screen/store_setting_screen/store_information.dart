import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import 'Provider/get_store_info_provider.dart';

class StoreInnfoScreen extends StatefulWidget {
  const StoreInnfoScreen({super.key});

  @override
  State<StoreInnfoScreen> createState() => _StoreInnfoScreenState();
}

class _StoreInnfoScreenState extends State<StoreInnfoScreen> {
  List currencyName = [
    'left'.tr,
    'right'.tr,
  ];
  List lang = [
    'en',
    'ar',
    'ur',
  ];
  List shopType = [
    'I will sale digital products'.tr,
    'I will sale physical products'.tr,
  ];
  List receivingMethod = [
    'whatsapp'.tr,
    'email'.tr,
  ];
  @override
  void initState() {
    getDataStore();
    super.initState();
  }

  getDataStore() async {
    final GetAndUpdateStoreProvider provider =
        Provider.of<GetAndUpdateStoreProvider>(context, listen: false);
    await provider.getStoreInformation();
    provider.storeNameController.text =
        provider.getStoreInfoModel?.data?.shopName ?? '';
    provider.storeDiscriptionController.text =
        provider.getStoreInfoModel?.data?.shopDescription ?? '';
    provider.notificationController.text =
        provider.getStoreInfoModel?.data?.storeEmail ?? '';
    provider.orderIdController.text =
        provider.getStoreInfoModel?.data?.orderPrefix ?? '';
    provider.orderIdController.text =
        provider.getStoreInfoModel?.data?.orderPrefix ?? '';
    // provider.selectedCurrencyName = provider.getStoreInfoModel?.data?.currency?.currencyPosition.toString()?? '';
    provider.currencyNameController.text = 'PKR';
    provider.currencyIconController.text = 'RS.';
    provider.taxController.text = provider.getStoreInfoModel?.data?.tax ?? '';
    if (provider.getStoreInfoModel?.data?.activeTheme?.shopType == 0) {
      provider.shopValue = 'I will sale digital products'.tr;
    } else {
      provider.shopValue = 'I will sale physical products'.tr;
    }
    provider.payment =
        provider.getStoreInfoModel?.data?.orderReceiveMethod ?? '';
    if (provider.getStoreInfoModel?.data?.languages == 'en') {
      provider.selectLang = 'en';
    } else if (provider.getStoreInfoModel?.data?.languages == 'ur') {
      provider.selectLang = 'ur';
    } else {
      provider.selectLang = 'ar';
    }
    //provider.selectLang = provider.getStoreInfoModel?.data?.languages?.?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final GetAndUpdateStoreProvider provider =
        Provider.of<GetAndUpdateStoreProvider>(context);
    return DataLoading(
      isLoading: provider.loading!,
      child: Scaffold(
        body: provider.getStoreInfoModel == null
            ? SizedBox()
            : Container(
                height: 100.h,
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Store Name'.tr,
                          hint: 'store name'.tr,
                          controller: provider.storeNameController),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Text(
                          'Store Discription'.tr,
                          style:
                              TextStyle(color: Colors.black, fontSize: 11.sp),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Container(
                          height: 11.h,
                          width: 88.w,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.left,
                            maxLines: null,
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            style: TextStyle(fontSize: 12.sp),
                            controller: provider.storeDiscriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              labelStyle: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 10.sp),
                              contentPadding: EdgeInsets.only(
                                  top: 1.h, left: 2.w, right: 2.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Notification & Reply-to-Email'.tr,
                          hint: 'info@',
                          controller: provider.notificationController),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Order Id Format'.tr,
                          hint: '#Lamp',
                          controller: provider.orderIdController),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Text(
                          'Currency Position'.tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: DropdownButton(
                          isExpanded: true,
                          value: provider.selectedCurrencyName,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 3.h,
                          ),
                          underline: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          items: currencyName.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                '${e}',
                                style: TextStyle(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              provider.selectedCurrencyName = newValue!;
                              // int id = provider
                              //     .allBrandsModel!
                              //     .data!
                              //     .categories![provider
                              //     .allBrandsModel!.data!.categories!
                              //     .indexWhere((element) =>
                              // element.name == newValue)]
                              //     .id!;
                              // provider.allBrandsModel!.data!.categories!
                              //     .forEach((element) {
                              //   if (selectCategoriesIds!
                              //       .contains(element.id!)) {
                              //     selectCategoriesIds!.remove(element.id!);
                              //   }
                              // });
                              // selectCategoriesIds!.add(id);
                            });
                          },
                          hint: Text(
                            "Select Currency Position".tr,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Currency Name'.tr,
                          hint: 'Rs.',
                          controller: provider.currencyNameController),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Currency Icon'.tr,
                          hint: 'Rs.',
                          controller: provider.currencyIconController),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomLineTextField(
                          name: 'Tax'.tr,
                          hint: 'taxis',
                          controller: provider.taxController),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Text(
                          'I will sale (shop type)'.tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      // SizedBox(height: 1.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: DropdownButton(
                          isExpanded: true,
                          value: provider.shopValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 3.h,
                          ),
                          underline: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          items: shopType.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                '${e}',
                                style: TextStyle(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              provider.shopValue = newValue!;
                              provider.shopValueIndex =
                                  shopType.indexOf(newValue);
                              print('objectof id ${provider.shopValueIndex}');
                            });
                          },
                          hint: Text(
                            "Select Shop Type".tr,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Text(
                          'Order Received Method'.tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      // SizedBox(height: 1.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: DropdownButton(
                          isExpanded: true,
                          value: provider.payment,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 3.h,
                          ),
                          underline: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          items: receivingMethod.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                '${e}',
                                style: const TextStyle(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              provider.payment = newValue!;
                              // int id = provider
                              //     .allBrandsModel!
                              //     .data!
                              //     .categories![provider
                              //     .allBrandsModel!.data!.categories!
                              //     .indexWhere((element) =>
                              // element.name == newValue)]
                              //     .id!;
                              // provider.allBrandsModel!.data!.categories!
                              //     .forEach((element) {
                              //   if (selectCategoriesIds!
                              //       .contains(element.id!)) {
                              //     selectCategoriesIds!.remove(element.id!);
                              //   }
                              // });
                              // selectCategoriesIds!.add(id);
                            });
                          },
                          hint: Text(
                            "Select Shop Type".tr,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Text(
                          'Language'.tr,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      // SizedBox(height: 1.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: DropdownButton(
                          isExpanded: true,
                          value: provider.selectLang,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                            size: 3.h,
                          ),
                          underline: Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          items: lang.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                '${e}',
                                style: const TextStyle(color: Colors.black54),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              provider.selectLang = newValue!;
                              // int id = provider
                              //     .allBrandsModel!
                              //     .data!
                              //     .categories![provider
                              //     .allBrandsModel!.data!.categories!
                              //     .indexWhere((element) =>
                              // element.name == newValue)]
                              //     .id!;
                              // provider.allBrandsModel!.data!.categories!
                              //     .forEach((element) {
                              //   if (selectCategoriesIds!
                              //       .contains(element.id!)) {
                              //     selectCategoriesIds!.remove(element.id!);
                              //   }
                              // });
                              // selectCategoriesIds!.add(id);
                            });
                          },
                          hint: const Text(
                            "Select Language",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await provider.updateStoreInfoApi();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 5.5.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: Color(0xff005493),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
