import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/custom_toast.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/product_screens/edit_product/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_line_textfield.dart';
import '../Provider/add_product_provider.dart';

class AddProductScreen extends StatefulWidget {
  final bool? from_first_add;
  const AddProductScreen({Key? key, this.from_first_add = false})
      : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);
    return Scaffold(
      body: DataLoading(
        isLoading: provider.loading,
        child: Stack(
          children: [
            Column(
              children: [
                if (widget.from_first_add == true)
                  Container(
                    height: 6.h,
                    color: blueColor,
                  ),
                Container(
                  height: 8.h,
                  color: blueColor,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/back_arrow.svg',
                                height: 2.h,
                              )),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            'Add Product',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomLineTextField(
                    name: 'Product Name*',
                    hint: 'Lamp',
                    controller: provider.nameController),
                CustomLineTextField(
                    name: 'Price*',
                    hint: 'Rs. Price*',
                    controller: provider.priceController),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      Text('Manage Stoke'),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: FlutterSwitch(
                          activeColor: blueColor,
                          inactiveColor: Color(0xff484848),
                          width: 10.w,
                          height: 2.7.h,
                          valueFontSize: 25.0,
                          toggleSize: 2.3.h,
                          value: provider.value,
                          borderRadius: 30.0,
                          padding: 1,
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              provider.value = val;
                            });
                            print('objectfalse ${provider.value}');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomLineTextField(
                    name: 'Stock Quantity',
                    hint: 'Quantity',
                    controller: provider.quantityController),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w,right: 2.w),
                      child: FlutterSwitch(
                        activeColor: blueColor,
                        inactiveColor: Color(0xff484848),
                        width: 10.w,
                        height: 2.7.h,
                        valueFontSize: 25.0,
                        toggleSize: 2.3.h,
                        value: true,
                        borderRadius: 30.0,
                        padding: 1,
                        showOnOff: false,
                        onToggle: (val) {},
                      ),
                    ),
                    Text('Pulished'),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
            Positioned(
              bottom: 5.h,
              left: 4.w,
              child: GestureDetector(
                onTap: () async {
                  if (provider.nameController.text.isNotEmpty &&
                      provider.priceController.text.isNotEmpty &&
                      provider.quantityController.text.isNotEmpty) {
                    await provider.add_product_data();
                    CustomToastManager.showToast(
                        context: context,
                        height: 8.h,
                        width: 60.w,
                        message: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                                  'Product created\nsuccessfully',
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
                  } else {
                    Get.snackbar('Alert', 'Please fill up all fields.');
                  }
                },
                child: Container(
                  height: 5.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
