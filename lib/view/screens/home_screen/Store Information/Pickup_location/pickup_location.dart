import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_line_textfield.dart';
import '../../Update Store Setup/update_store_provider.dart';

class PickupLocation extends StatefulWidget {
  const PickupLocation({super.key});

  @override
  State<PickupLocation> createState() => _PickupLocationState();
}

class _PickupLocationState extends State<PickupLocation> {
  @override
  Widget build(BuildContext context) {
    final UpdateStoreProvider provider =
        Provider.of<UpdateStoreProvider>(context);
    return DataLoading(
      isLoading: provider.storeLocationLoading,
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          child: SingleChildScrollView(
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
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Company'.tr,
                    hint: 'company'.tr,
                    controller: provider.companyNameController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Address'.tr,
                    hint: 'address',
                    controller: provider.addressController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'City'.tr,
                    hint: 'city',
                    controller: provider.cityController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'State'.tr,
                    hint: 'state',
                    controller: provider.stateController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Postal/Zip code'.tr,
                    hint: 'Postal code',
                    controller: provider.zipCodeController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Email'.tr,
                    hint: ' Enter Email',
                    controller: provider.emailController),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Phone'.tr,
                    hint: 'Enter Phone',
                    controller: provider.phoneController),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Text(
                      'Invoice Discription'.tr,
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
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
                      controller: provider.invoiceController,
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
                GestureDetector(
                  onTap: () async {
                    if (provider.companyNameController.text.isNotEmpty &&
                        provider.addressController.text.isNotEmpty &&
                        provider.cityController.text.isNotEmpty &&
                        provider.stateController.text.isNotEmpty &&
                        provider.zipCodeController.text.isNotEmpty &&
                        provider.emailController.text.isNotEmpty &&
                        provider.phoneController.text.isNotEmpty &&
                        provider.invoiceController.text.isNotEmpty) {
                      await provider.storeLocationApi();
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
