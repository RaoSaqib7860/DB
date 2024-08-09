import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../Update Store Setup/update_store_provider.dart';

class StoreInformation extends StatefulWidget {
  const StoreInformation({super.key});

  @override
  State<StoreInformation> createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
  List currencyName = [
    'left',
    'right',
  ];
  List lang = [
    'eng',
    'ur',
  ];
  List shopType = [
    'I will sale digital products',
    'I will sale physical products',
  ];
  List receivingMethod = [
    'whatsapp',
    'email',
  ];

  @override
  Widget build(BuildContext context) {
    final UpdateStoreProvider provider =
    Provider.of<UpdateStoreProvider>(context);
    return Scaffold(
      body: Container(
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
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 2.w,),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                      SizedBox(width: 40.w,),
                      Text('Store Setting',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              CustomLineTextField(
                  name: 'Store Name',
                  hint: 'store name',
                  controller: provider.storeNameController
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Text(
                  'Store Discription',
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
              SizedBox(height: 2.h,),
              CustomLineTextField(
                name: 'Notification & Reply-to-Email',
                hint: 'info@',
                 controller: provider.notificationController
              ),
              SizedBox(height: 2.h,),
              CustomLineTextField(
                name: 'Order Id Format',
                hint: '#Lamp',
                 controller: provider.orderIdController
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Text(
                  'Currency Position',
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
                    items: currencyName
                        .map((e) {
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
                      "Select Currency Position",
                      style: TextStyle(
                          fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),
              SizedBox(
                height: 2.h,
              ),
              CustomLineTextField(
                name: 'Currency Name',
                hint: 'Rs.',
                 controller: provider.currencyNameController
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomLineTextField(
                name: 'Currency Icon',
                hint: 'Rs.',
                 controller: provider.currencyIconController
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomLineTextField(
                name: 'Tax',
                hint: 'taxis',
                 controller: provider.taxController
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Text(
                  'Shop Type',
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
                  items: shopType
                      .map((e) {
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
                    "Select Shop Type",
                    style: TextStyle(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: const Text(
                  'Order Received payment',
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
                  items: receivingMethod
                      .map((e) {
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
                  hint: const Text(
                    "Select Shop Type",
                    style: TextStyle(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: const Text(
                  'Order Received payment',
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
                  items: lang
                      .map((e) {
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
                    style: TextStyle(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () async{
                  await provider.storeInfoApi();
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
    );
  }
}
