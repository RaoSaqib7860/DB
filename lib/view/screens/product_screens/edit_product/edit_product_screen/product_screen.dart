import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../custom_widgets/custom_line_textfield.dart';
import '../../../Brands/Brands Model/brand_model.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../../Provider/add_product_provider.dart';

class ProductScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const ProductScreen({this.index, Key? key, this.productId}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController nameControllerT = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController featuresController = TextEditingController();
  TextEditingController desController = TextEditingController();
  HtmlEditorController contentController = HtmlEditorController();
  bool publish = false;
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var featureList = [
    'Trending products',
    'Best selling product',
  ];
  String? selectFeature;
  int? selectIndex;
  int? selectIndexBrands;
  Categories? dropdownvalue;
  String? selected_categorie;
  String? selected_brand;
  @override
  void initState() {
    api_call();
    super.initState();
  }

  List<int>? selectCategoriesIds = [];
  api_call() async {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context, listen: false);
    await provider.update_product_data(productId: widget.productId);
    await provider.get_brands_data();
    await provider.get_categories_data();
    print('updateProductModel...${provider.updateProductModel!.toJson()}');
    if (provider.updateProductModel?.data?.product?.featured == 1) {
      selectFeature = 'Trending products';
    } else if (provider.updateProductModel?.data?.product?.featured == 2) {
      selectFeature = 'Best selling product';
    }
    selectCategoriesIds = provider.updateProductModel?.data?.categoryIds ?? [];
    publish =
        provider.updateProductModel?.data?.product?.status == 1 ? true : false;
    contentController
        .insertHtml(provider.updateProductModel?.data?.content?.content ?? '');
    nameControllerT.text =
        provider.updateProductModel?.data?.product?.title ?? '';
    slugController.text =
        provider.updateProductModel!?.data?.product?.slug ?? '';
    featuresController.text =
        provider.updateProductModel?.data?.product?.featured.toString() ?? '';
    desController.text =
        provider.updateProductModel?.data?.content?.excerpt ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);

    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: provider.updateProductModel == null
              ? SizedBox()
              : Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          child: Row(
                            children: [
                              CupertinoSwitch(
                                value: publish,
                                onChanged: (val) {
                                  setState(() {
                                    publish = val;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                'Published'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Color(0xff4C4C4C)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomLineTextField(
                            name: 'Product Name'.tr,
                            hint: 'Lamp',
                            controller: nameControllerT),
                        CustomLineTextField(
                            name: 'Slug'.tr,
                            hint: 'Lamp',
                            controller: slugController),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Text(
                            'Short Discription'.tr,
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
                              controller: desController,
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
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Text(
                            'Product Content'.tr,
                            style:
                                TextStyle(color: Colors.black, fontSize: 11.sp),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: HtmlEditor(
                            controller: contentController, //required
                            htmlEditorOptions:  HtmlEditorOptions(
                              hint: "Write product content".tr,
                            ),
                            otherOptions: OtherOptions(
                              height: 25.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Text(
                            'Brand'.tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        if (provider.allBrandsModel != null)
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 4.w),
                            child: DropdownButton(
                              isExpanded: true,
                              value: selected_brand,
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
                              items: provider.allBrandsModel!.data!.categories!
                                  .map((e) {
                                return DropdownMenuItem(
                                  value: e.name,
                                  child: Text(
                                    '${e.name}',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  selected_brand = newValue!;
                                  int id = provider
                                      .allBrandsModel!
                                      .data!
                                      .categories![provider
                                          .allBrandsModel!.data!.categories!
                                          .indexWhere((element) =>
                                              element.name == newValue)]
                                      .id!;
                                  provider.allBrandsModel!.data!.categories!
                                      .forEach((element) {
                                    if (selectCategoriesIds!
                                        .contains(element.id!)) {
                                      selectCategoriesIds!.remove(element.id!);
                                    }
                                  });
                                  selectCategoriesIds!.add(id);
                                });
                              },
                              hint: Text(
                                "Select Brand".tr,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        if (provider.allBrandsModel != null)
                          Wrap(
                            children: provider.allBrandsModel!.data!.categories!
                                .map((e) {
                              return selectCategoriesIds!.contains(e.id)
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Chip(
                                        label: Text('${e.name}'),
                                        onDeleted: () {
                                          selectCategoriesIds!.remove(e.id);
                                          setState(() {});
                                        },
                                      ),
                                    )
                                  : SizedBox();
                            }).toList(),
                          ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Text(
                            'Category'.tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        if (provider.cateoryProductModel != null)
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 4.w),
                            child: DropdownButton(
                              isExpanded: true,
                              value: selected_categorie,
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
                              items: provider
                                  .cateoryProductModel!.data!.categories!
                                  .map((e) {
                                return DropdownMenuItem(
                                  value: e.name,
                                  child: Text(
                                    '${e.name}',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                print('newValue...${newValue}');
                                setState(() {
                                  selected_categorie = newValue!;
                                  int id = provider
                                      .cateoryProductModel!
                                      .data!
                                      .categories![provider.cateoryProductModel!
                                          .data!.categories!
                                          .indexWhere((element) =>
                                              element.name == newValue)]
                                      .id!;
                                  if (!selectCategoriesIds!.contains(id)) {
                                    selectCategoriesIds!.add(id);
                                    print('objectnnnn${selectCategoriesIds}');
                                  }
                                });
                              },
                              hint: Text(
                                "Select Category".tr,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        if (provider.cateoryProductModel != null)
                          Wrap(
                            children: provider
                                .cateoryProductModel!.data!.categories!
                                .map((e) {
                              return selectCategoriesIds!.contains(e.id)
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Chip(
                                        label: Text('${e.name}'),
                                        onDeleted: () {
                                          selectCategoriesIds!.remove(e.id);
                                          setState(() {});
                                        },
                                      ),
                                    )
                                  : SizedBox();
                            }).toList(),
                          ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectFeature,
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
                            items: featureList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  '${e}'.tr,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              );
                            }).toList(),
                            onChanged: (dynamic newValue) {
                              setState(() {
                                selectFeature = newValue!;
                                selectIndex = featureList.indexOf(newValue);
                              });
                            },
                            hint: Text(
                              "Select Feature".tr,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                        // CustomLineTextField(
                        //     name: 'Features',
                        //     hint: 'None',
                        //     controller: featuresController),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  print('${selectCategoriesIds}');
                                  int? brand_id;
                                  provider.allBrandsModel!.data!.categories!
                                      .forEach((element) {
                                    if (selectCategoriesIds!
                                        .contains(element.id)) {
                                      brand_id = element.id;
                                      selectCategoriesIds!.remove(element.id);
                                    }
                                  });
                                  print(
                                      'selectCategoriesIds..${selectCategoriesIds!.join(',')}');
                                  print('brand_id...$brand_id');
                                  Map<String, dynamic>? map = {
                                    'user_id': '${user_model.data!.userId}',
                                    'product_id': '${widget.productId}',
                                    'title': '${nameControllerT.text}',
                                    'slug': '${slugController.text}',
                                    'excerpt': '${desController.text}',
                                    'content':
                                        await contentController.getText(),
                                    'status': publish ? '1' : '2',
                                    'featured': selectFeature == null
                                        ? null
                                        : selectFeature == 'Trending products'
                                            ? '1'
                                            : '2',
                                    'cats[]': selectCategoriesIds!.isEmpty
                                        ? null
                                        : '${selectCategoriesIds!.join(',')}',
                                    'brand':
                                        brand_id == null ? null : '${brand_id}',
                                  };
                                  map.removeWhere(
                                      (key, value) => value == null);
                                  provider.get_update_product_data(
                                      context: context, map: map);
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.w, vertical: 0.8.h),
                                    child: Text(
                                      'Next'.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.sp),
                                    ),
                                  ),
                                ),
                              )
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
      ),
    );
  }
}
