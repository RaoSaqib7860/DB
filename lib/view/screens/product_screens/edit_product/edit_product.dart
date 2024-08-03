//import 'package:dial_box/view/screens/edit_product/edit_product_screen/pricing_screen.dart';
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

//import '../category_screen/category_screen.dart';
import '../../../../custom_widgets/custom_bottomsheet.dart';
import '../../../../custom_widgets/custom_fill_container.dart';
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
  String? dropdownvalue;
  final String? productId;
  EditProductScreen({Key? key, this.dropdownvalue, this.productId})
      : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: SvgPicture.asset(
                        'assets/svgs/back_arrow.svg',
                        height: 2.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  Text(
                    'Edit Product',
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
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
                              'Select Page',
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
                            widget.dropdownvalue = 'Product';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'Product'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Product',
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
                            widget.dropdownvalue = 'Pricing';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'Pricing'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Pricing',
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
                            widget.dropdownvalue = 'Images';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'Images'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Images',
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
                            widget.dropdownvalue = 'Inventory';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'Inventory'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Inventory',
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
                            widget.dropdownvalue = 'SEO';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'SEO'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'SEO',
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
                            widget.dropdownvalue = 'Express Checkout';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              widget.dropdownvalue == 'Express Checkout'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Express Checkout',
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
                            widget.dropdownvalue!,
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
          if (widget.dropdownvalue == 'Product')
            Expanded(
                child: ProductScreen(
              productId: widget.productId,
            )),
          if (widget.dropdownvalue == 'Pricing')
            Expanded(
                child: PricingScreen(
              productId: widget.productId,
            )),
          if (widget.dropdownvalue == 'Images')
            Expanded(
                child: ImageScreen(
              productId: widget.productId,
            )),
          if (index == 4) Expanded(child: OptionScreen()),
          if (index == 5) Expanded(child: VariantScreen()),
          if (widget.dropdownvalue == 'Inventory')
            Expanded(child: InventoryScreen()),
          if (index == 7) Expanded(child: FilesScreen()),
          if (widget.dropdownvalue == 'SEO')
            Expanded(
                child: SEOScreen(
              productId: widget.productId,
            )),
          if (widget.dropdownvalue == 'Express Checkout')
            Expanded(child: CheckoutScreen())
        ],
      ),
    );
  }
}
