
import 'dart:convert';

import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Model/login_model.dart';
import 'package:db_2_0/view/screens/bottom_sheet/bottom_sheet.dart';
import 'package:db_2_0/view/screens/product_screens/edit_product/edit_product.dart';
import 'package:db_2_0/view/screens/product_screens/edit_product/edit_product_screen/pricing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

import '../../Models/category_product_model.dart';
import '../../Provider/add_product_provider.dart';

class ProductScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const ProductScreen({this.index,Key? key,this.productId}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController nameControllerT = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController featuresController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool _value = false;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  Categories? dropdownvalue;
  @override
  void initState() {
    api_call();
    super.initState();
  }
  api_call()async{
    final AddProductProvider provider =
    Provider.of<AddProductProvider>(context, listen: false);
   await provider.update_product_data(productId: widget.productId);
   await provider.get_brands_data();
//final String htmlContent = """${provider.updateProductModel!.data!.product!.content!.value!}""";
    nameControllerT.text = provider.updateProductModel!.data!.product!.title!;
    slugController.text = provider.updateProductModel!.data!.product!.slug!;
    //categoryController.text = htmlContent;
    featuresController.text = provider.updateProductModel!.data!.product!.featured!.toString();
    desController.text = provider.updateProductModel!.data!.product!.content!.value!;
    contentController.text = provider.updateProductModel!.data!.product!.title!;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider = Provider.of<AddProductProvider>(context);

    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child:provider.updateProductModel == null? SizedBox(): Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                    child: Row(
                      children: [
                        FlutterSwitch(
                          width: 9.w,
                          height: 2.4.h,
                          valueFontSize: 25.0,
                          toggleSize: 16,
                          value: _value,
                          borderRadius: 30.0,
                          padding: 1,
                          showOnOff: false,
                          inactiveColor: Color(0xff505050),
                          onToggle: (val) {
                            setState(() {
                              _value = val;
                            });
                          },
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          'Published',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff4C4C4C)
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  CustomLineTextField(name: 'Product Name',hint: 'Lamp',controller: nameControllerT),
                  CustomLineTextField(name: 'Slug',hint: 'Lamp',controller: slugController),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Short Discription',
                      style: TextStyle(color: Colors.black,fontSize: 11.sp),
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
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
                        controller: desController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
                          hintStyle: TextStyle(fontSize: 10.sp),
                          contentPadding: EdgeInsets.only(top: 1.h,left: 2.w,right: 2.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Product Content',
                      style: TextStyle(color: Colors.black,fontSize: 11.sp),
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
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
                        controller: contentController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                          labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
                          hintStyle: TextStyle(fontSize: 10.sp),
                          contentPadding: EdgeInsets.only(top: 1.h,left: 2.w,right: 2.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: Text(
                      'Brand',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 3.h,),
                      underline: Padding(
                        padding:  EdgeInsets.only(top: 1.h),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      items: provider.allBrandsModel!.data!.categories!.map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text('${e.name}',style: TextStyle(color: Colors.black54),),
                        );
                      }).toList(),
                      onChanged: (dynamic newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      hint:  Text(
                        "Select Brand",
                        style: TextStyle(fontSize: 12,color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  CustomLineTextField(name: 'Category',hint: 'None',controller: categoryController),
                  CustomLineTextField(name: 'Features',hint: 'None',controller: featuresController),

                  SizedBox(height: 2.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            CustomToastManager.showToast(
                                context: context,
                                height: 8.h,
                                width: 60.w,
                                message: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5.w,),
                                        SvgPicture.asset('assets/svgs/pro_toast.svg',height: 3.h,),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Changes saved\nsuccessfully',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.black,
                                            height: 0.16.h,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            );
                            Get.offAll(BottomSheetScreen(index: 2,));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: redColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.7.w,vertical: 0.8.h),
                              child: Text(
                                'Save Changes',
                                style: TextStyle(color: Colors.white,fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w,),
                        GestureDetector(
                          onTap: () {
                            //Get.to(EditProductScreen(dropdownvalue: 'Pricing',));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 0.8.h),
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white,fontSize: 10.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
