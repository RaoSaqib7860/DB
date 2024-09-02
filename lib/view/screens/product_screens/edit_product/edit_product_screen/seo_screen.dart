import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../../bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';

import '../../Provider/add_product_provider.dart';

class SEOScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const SEOScreen({this.index, Key? key, this.productId}) : super(key: key);

  @override
  State<SEOScreen> createState() => _SEOScreenState();
}

class _SEOScreenState extends State<SEOScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  void initState() {
    api_call();
    super.initState();
  }

  api_call() async {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context, listen: false);
    provider.updateProductSEOModel = null;
    setState(() {});
    await provider.update_SEO_product_data(map: {
      'user_id': '${user_model.data!.userId}',
      'product_id': '${widget.productId}',
    });
    titleController.text = provider.updateProductSEOModel!.data!.metaTitle!;
    keyController.text = provider.updateProductSEOModel!.data!.metaKeyword!;
    desController.text = provider.updateProductSEOModel!.data!.metaDescription!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);

    return DataLoading(
      isLoading: provider.seo_loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: provider.updateProductSEOModel == null
              ? SizedBox()
              : Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.grey.withAlpha(100), width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.h),
                                child: Text(
                                  'META TITLE'.tr,
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.2.h),
                                child: Container(
                                  height: 4.h,
                                  child: TextField(
                                    style: TextStyle(fontSize: 12.sp),
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      hintText: 'Title'.tr,
                                      labelText: 'Title'.tr,
                                      labelStyle: TextStyle(
                                          fontSize: 10.sp, color: Colors.grey),
                                      hintStyle: TextStyle(fontSize: 10.sp),
                                      contentPadding: EdgeInsets.only(
                                          top: 0.5.h, left: 2.w, right: 2.w),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 2.h,),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.h),
                                child: Text(
                                  'META KEYWORD'.tr,
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.2.h),
                                child: Container(
                                  height: 4.h,
                                  child: TextField(
                                    style: TextStyle(fontSize: 12.sp),
                                    controller: keyController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      hintText: 'Title'.tr,
                                      labelText: 'Keyword'.tr,
                                      labelStyle: TextStyle(
                                          fontSize: 10.sp, color: Colors.grey),
                                      hintStyle: TextStyle(fontSize: 10.sp),
                                      contentPadding: EdgeInsets.only(
                                          top: 0.5.h, left: 2.w, right: 2.w),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.h),
                                child: Text(
                                  'META DESCRIPTION'.tr,
                                  style: TextStyle(fontSize: 9.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 1.2.h),
                                child: Container(
                                  height: 10.h,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    // minLines: 1,
                                    textAlign: TextAlign.left,
                                    maxLines: null,
                                    expands: true,
                                    textAlignVertical: TextAlignVertical.top,
                                    style: TextStyle(fontSize: 12.sp),
                                    controller: desController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      //isDense: true,
                                      hintText: 'Title'.tr,
                                      //  labelText: 'Title',
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
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Text(
                          'Search Engine Optimization'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                                  height: 1.h,
                                ),
                                Text(
                                  'Online Shopping'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'https://octanefashion.dialboxx.com/seller/product/4052/express-checkout',
                                  style: TextStyle(
                                    color: Color(0xff1568A8),
                                    fontSize: 8.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Jun 6, 2024 - if you want this this product you can call me anytime i will deliver your order than and there so you and have your product really fast.',
                                  style: TextStyle(
                                    color: Color(0xff454545),
                                    fontSize: 8.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await provider.update_SEO_product_data(map: {
                                  'user_id': '${user_model.data!.userId}',
                                  'product_id': '${widget.productId}',
                                  'meta_title': '${titleController.text}',
                                  'meta_keyword': '${keyController.text}',
                                  'meta_description': '${desController.text}',
                                }, update: true);
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
