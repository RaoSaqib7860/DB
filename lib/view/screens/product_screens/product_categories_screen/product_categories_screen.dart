import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../custom_widgets/app_colors.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Provider/all_product_provider.dart';
import 'create_category_screen.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  var items = [
    'Delete Permanently'.tr,
  ];
  String? dropdownvalue;

  @override
  void initState() {
    get_cat();
    super.initState();
  }

  get_cat() async {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context, listen: false);
    await provider
        .get_categories(map: {'user_id': '${user_model.data!.userId}'});
    category_loading = false;
    setState(() {});
  }

  bool category_loading = true;
  @override
  Widget build(BuildContext context) {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context);
    return DataLoading(
      isLoading: category_loading,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 3.5.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Row(
                    children: [
                      Container(
                        height: 3.h,
                        width: 33.w,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 1.w),
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Container(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 2.h,
                                color: Colors.black,
                              ),
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 9.sp, color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                              hint: Text(
                                'Select Action'.tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6)),
                        ),
                        child: Center(
                          child: Text(
                            'Submit'.tr,
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateCategoryScreen(),
                        )).then((value) {
                      provider.get_categories(
                          map: {'user_id': '${user_model.data!.userId}'});
                    });
                  },
                  child: Container(
                    height: 3.5.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Create Category',
                        style: TextStyle(color: Colors.white, fontSize: 9.sp),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: category_loading
                    ? SizedBox()
                    : provider.cateoryProductModel?.data?.categories?.length ==
                                0 ||
                            provider.cateoryProductModel?.data?.categories
                                    ?.length ==
                                null
                        ? SizedBox(
                            height: 50.h,
                            width: 100.w,
                            child: const Center(
                              child: Text("No data"),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await provider.get_categories(map: {
                                'user_id': '${user_model.data!.userId}'
                              });
                            },
                            child: ListView.builder(
                              itemCount: provider.cateoryProductModel?.data
                                      ?.categories?.length ??
                                  0,
                              padding: EdgeInsets.only(bottom: 12.h),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withAlpha(50),
                                                  offset: Offset(1, 1),
                                                  spreadRadius: 1,
                                                  blurRadius: 2),
                                              BoxShadow(
                                                  color:
                                                      Colors.grey.withAlpha(50),
                                                  offset: Offset(-1, -1),
                                                  spreadRadius: 1,
                                                  blurRadius: 2),
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 9.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl: provider
                                                                .cateoryProductModel!
                                                                .data!
                                                                .categories![
                                                                    index]
                                                                .metas!
                                                                .isEmpty
                                                            ? ''
                                                            : "https://${user_model.data?.domain}/${provider.cateoryProductModel?.data?.categories?[index].metas?.first.content}",
                                                        fit: BoxFit.contain,
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                Center(
                                                          child: CircularProgressIndicator(
                                                              strokeWidth: 1.5,
                                                              value:
                                                                  downloadProgress
                                                                      .progress),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'https://octanefashion.dialboxx.com/uploads/default.png'),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${provider.cateoryProductModel?.data?.categories?[index].name}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color: Color(
                                                                0xff3E3E3E),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Text(
                                                          '/Category/${provider.cateoryProductModel?.data?.categories?[index].name}/${provider.cateoryProductModel?.data?.categories?[index].id}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 8.sp,
                                                              color: Color(
                                                                  0xff3E3E3E),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                      onTap: () async {
                                                        Map<String, dynamic>
                                                            map = {
                                                          'user_id':
                                                              '${user_model.data!.userId}',
                                                          'action': 'remove',
                                                          'cat_id':
                                                              '${provider.cateoryProductModel?.data?.categories?[index].id}',
                                                          'domain_id':
                                                              '${user_model.data!.domainId}',
                                                        };
                                                        //map.removeWhere((key, value) => value == null);
                                                        await provider
                                                            .upload_categories(
                                                                uploadMedia: dio
                                                                        .FormData
                                                                    .fromMap(
                                                                        map));
                                                        await provider
                                                            .get_categories(
                                                                map: {
                                                              'user_id':
                                                                  '${user_model.data!.userId}'
                                                            });
                                                      },
                                                      child: Icon(
                                                        CupertinoIcons.delete,
                                                        color: Colors.red,
                                                      )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Colors.black26,
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CreateCategoryScreen(
                                                              Category: provider
                                                                  .cateoryProductModel
                                                                  ?.data
                                                                  ?.categories?[index],
                                                            ),
                                                          )).then((value) {
                                                        provider.get_categories(
                                                            map: {
                                                              'user_id':
                                                                  '${user_model.data!.userId}'
                                                            });
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/svgs/action.svg',
                                                          height: 2.7.h,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                          'Action'.tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10.sp,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Featured:'.tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: blueColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      2.5.w,
                                                                  vertical:
                                                                      0.4.h),
                                                          child: Text(
                                                            provider
                                                                        .cateoryProductModel
                                                                        ?.data
                                                                        ?.categories?[
                                                                            index]
                                                                        .featured ==
                                                                    1
                                                                ? 'Yes'.tr
                                                                : 'No'.tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 9.sp),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Created at'.tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff0B7A3E),
                                                          fontSize: 9.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.3.h,
                                                      ),
                                                      Text(
                                                        '1 month ago'.tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff636363),
                                                          fontSize: 8.5.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ))
          ],
        ),
      ),
    );
  }
}
