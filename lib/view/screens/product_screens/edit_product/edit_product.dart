import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../custom_widgets/custom_bottomsheet.dart';
import '../../../../custom_widgets/custom_fill_container.dart';
import '../Provider/add_product_provider.dart';
import 'edit_product_screen/checkout_screen.dart';
import 'edit_product_screen/files_screen.dart';
import 'edit_product_screen/image_screen.dart';
import 'edit_product_screen/inventory_screen.dart';
import 'edit_product_screen/option_screen.dart';
import 'edit_product_screen/pricing_screen.dart';
import 'edit_product_screen/product_screen.dart';
import 'edit_product_screen/seo_screen.dart';
import 'edit_product_screen/variants_screen.dart';

class EditProductScreen extends StatefulWidget {
  final String? productId;
  EditProductScreen({Key? key, this.productId}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 7.h,
            color: blueColor,
            child: Center(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (provider.selectedPage == 'Product') {
                        Navigator.pop(context);
                      } else if (provider.selectedPage == 'Pricing') {
                        provider.selectedPage = 'Product';
                        setState(() {});
                      } else if (provider.selectedPage == 'Images') {
                        provider.selectedPage = 'Pricing';
                        setState(() {});
                      } else if (provider.selectedPage == 'Inventory') {
                        provider.selectedPage = 'Images';
                        setState(() {});
                      } else if (provider.selectedPage == 'SEO') {
                        provider.selectedPage = 'Inventory';
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SvgPicture.asset(
                        'assets/svgs/back_arrow.svg',
                        height: 2.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Edit Product'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      provider.selectedPage = 'Product';
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back to Main'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                customBottomSheet(
                    context: context,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Page'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  'assets/svgs/cross.svg',
                                  height: 2.5.h,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.selectedPage = 'Product';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.selectedPage == 'Product'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Product'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.selectedPage = 'Pricing';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.selectedPage == 'Pricing'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Pricing'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.selectedPage = 'Images';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.selectedPage == 'Images'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Images'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.selectedPage = 'Inventory';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.selectedPage == 'Inventory'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Inventory'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.selectedPage = 'SEO';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.selectedPage == 'SEO'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'SEO'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                      ],
                    ));
              },
              child: Container(
                height: 3.5.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.w, right: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.selectedPage!,
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 2.2.h,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          if (provider.selectedPage == 'Product')
            Expanded(
                child: ProductScreen(
              productId: widget.productId,
            )),
          if (provider.selectedPage == 'Pricing')
            Expanded(
                child: PricingScreen(
              productId: widget.productId,
            )),
          if (provider.selectedPage == 'Images')
            Expanded(
                child: ImageScreen(
              productId: widget.productId,
            )),
          if (index == 4) Expanded(child: OptionScreen()),
          if (index == 5) Expanded(child: VariantScreen()),
          if (provider.selectedPage == 'Inventory')
            Expanded(
                child: InventoryScreen(
              productId: widget.productId,
            )),
          if (index == 7) Expanded(child: FilesScreen()),
          if (provider.selectedPage == 'SEO')
            Expanded(
                child: SEOScreen(
              productId: widget.productId,
            )),
          if (provider.selectedPage == 'Express Checkout')
            Expanded(child: CheckoutScreen())
        ],
      ),
    );
  }
}
