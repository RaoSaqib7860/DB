import 'package:db_2_0/view/screens/product_screens/product_attribute_screens/product_attribute_screens.dart';
import 'package:db_2_0/view/screens/product_screens/product_brand_screen/product_brand_screen.dart';
import 'package:db_2_0/view/screens/product_screens/product_categories_screen/product_categories_screen.dart';
import 'package:db_2_0/view/screens/product_screens/publish_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import '../../../custom_widgets/custom_bottomsheet.dart';
import '../../../custom_widgets/custom_fill_container.dart';
import 'Provider/all_product_provider.dart';
import 'all_product_screen.dart';
import 'manage_inventory_screens/manage_inventory_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var items = [
    'All Products'.tr,
    'Manage Inventory'.tr,
    'Product Categories'.tr,
    'Product Attribute'.tr,
    'Product Brands'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 8.h,
            width: 100.w,
            color: blueColor,
            child: Center(
              child: Text(
                'Products'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
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
                          height: 4.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.dropdownvalue = 'All Products';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.dropdownvalue == 'All Products'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'All Product'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.dropdownvalue = 'Manage Inventory';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.dropdownvalue == 'Manage Inventory'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Manage Inventory'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.dropdownvalue = 'Product Categories';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.dropdownvalue == 'Product Categories'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Product Categories'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.dropdownvalue = 'Product Brands';
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              provider.dropdownvalue == 'Product Brands'
                                  ? customFillContainer()
                                  : SvgPicture.asset(
                                      'assets/svgs/empp.svg',
                                      height: 2.5.h,
                                    ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Product Brands'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ));
              },
              child: Container(
                height: 3.5.h,
                width: 48.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.dropdownvalue!,
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
          if (provider.dropdownvalue == 'All Products')
            Expanded(child: AllProductScreen()),
            if (provider.dropdownvalue == 'Manage Inventory')
            Expanded(child: ManageInventoryScreen()),
          if (provider.dropdownvalue == 'Product Categories')
            Expanded(child: ProductCategoriesScreen()),
          if (provider.dropdownvalue == 'Product Attribute')
            Expanded(child: ProductAttributeScreen()),
          if (provider.dropdownvalue == 'Product Brands')
            Expanded(child: ProductBrandScreen()),
        ],
      ),
    );
  }
}
