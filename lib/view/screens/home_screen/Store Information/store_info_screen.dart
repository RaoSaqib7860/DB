import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Update Store Setup/update_store_provider.dart';

class StoreInformation extends StatefulWidget {
  const StoreInformation({super.key});

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  List currencyName = [
    'left'.tr,
    'right'.tr,
  ];
  List lang = [
    'eng',
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
    final UpdateStoreProvider provider =
        Provider.of<UpdateStoreProvider>(context, listen: false);
    provider.currencyNameController.text = 'PK';
    provider.currencyIconController.text = 'Rs.';
    provider.storeNameController.text = '${user_model.data!.name}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UpdateStoreProvider provider =
        Provider.of<UpdateStoreProvider>(context);
    return Scaffold(
      body: DataLoading(
        isLoading: provider.storeInfoLoading,
        child: Container(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 7.h,
                  width: 100.w,
                  color: blueColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2.w,
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
                        width: 30.w,
                      ),
                      Text(
                        'Store Setting'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Store Name'.tr,
                    hint: 'store name'.tr,
                    enable: false,
                    controller: provider.storeNameController),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Text(
                    'Store Description'.tr,
                    style: TextStyle(color: Colors.black, fontSize: 11.sp),
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
                        labelStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.grey),
                        hintStyle: TextStyle(fontSize: 10.sp),
                        contentPadding:
                            EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
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
                  child:  Text(
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
                      child: Divider(
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
                      });
                    },
                    hint:  Text(
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
                    enable: false,
                    controller: provider.currencyNameController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Currency Icon'.tr,
                    hint: 'Rs.',
                    enable: false,
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
                  child:  Text(
                    'Shop Type'.tr,
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
                        provider.shopValueIndex = shopType.indexOf(newValue);
                        print('objectof id ${provider.shopValueIndex}');
                      });
                    },
                    hint:  Text(
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
                  child:  Text(
                    'Order Received payment'.tr,
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
                      });
                    },
                    hint:  Text(
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
                  child: const Text(
                    'Language',
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
                      });
                    },
                    hint:  Text(
                      "Select Language".tr,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (provider.storeNameController.text.isNotEmpty &&
                        provider.storeDiscriptionController.text.isNotEmpty &&
                        provider.notificationController.text.isNotEmpty &&
                        provider.orderIdController.text.isNotEmpty &&
                        provider.selectedCurrencyName != null &&
                        provider.currencyNameController.text.isNotEmpty &&
                        provider.shopValueIndex != null &&
                        provider.taxController.text.isNotEmpty &&
                        provider.payment != null) {
                      await provider.storeInfoApi();
                      Navigator.of(context).pop();
                    } else {
                      Get.snackbar('Alert',
                          'Some fields is missing .Kindly Fill up all fields.');
                    }
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
                          'Save'.tr,
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
