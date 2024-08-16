import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/product_screens/add_product_screen/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../api_repository/api_utils.dart';
import '../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import 'Provider/all_product_provider.dart';
import 'edit_product/edit_product.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({Key? key}) : super(key: key);

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  TextEditingController productController = TextEditingController();
  bool _value = false;
  var items = [
    'Publish',
    'Draft',
    'Incomplete',
    'Trash',
  ];

  @override
  void initState() {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context, listen: false);
    provider.get_product_data(
        map: {'user_id': '${user_model.data!.userId}', 'type': '1'});
    super.initState();
  }

  String? dropdownvalue;

  @override
  Widget build(BuildContext context) {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              hint: const Text(
                                "Select Action",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          if (dropdownvalue != null) {
                            int index = items.indexOf(dropdownvalue!);
                            if (index == 3) {
                              provider.get_product_data(map: {
                                'user_id': '${user_model.data!.userId}',
                                'type': '0'
                              });
                            } else {
                              provider.get_product_data(map: {
                                'user_id': '${user_model.data!.userId}',
                                'type': '${index + 1}'
                              });
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 9.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.5.h,
                  width: 100.w,
                  child: TextFormField(
                    style: TextStyle(fontSize: 12.sp),
                    controller: provider.searchController,
                    onChanged: (v) async {
                      provider.get_product_data(map: {
                        'user_id': '${user_model.data!.userId}',
                        'type': '${provider.index}',
                        'search': '$v'
                      });
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3)),
                      hintText: 'Search Orders',
                      hintStyle: TextStyle(fontSize: 11.sp, color: Colors.grey),
                      contentPadding: EdgeInsets.only(
                        top: 0.5.h,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff6D6D6D),
                        size: 2.3.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                    child: provider.loading
                        ? SizedBox()
                        : provider.allProductModel!.data!.posts!.isEmpty
                            ? Center(
                                child: Text('No Data Found'),
                              )
                            : RefreshIndicator(
                                onRefresh: () async {
                                  await provider.get_product_data(map: {
                                    'user_id': '${user_model.data!.userId}',
                                    'type': '1'
                                  });
                                },
                                child: ListView.builder(
                                  itemCount: provider
                                      .allProductModel!.data!.posts!.length,
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  itemBuilder: (context, index) {
                                    final fifteenAgo = DateTime.parse(
                                        '${provider.allProductModel!.data!.posts![index].createdAt}');
                                    return DataLoading(
                                      isLoading: provider.loading,
                                      child: Padding(
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
                                                        color: Colors.grey
                                                            .withAlpha(50),
                                                        offset: Offset(1, 1),
                                                        spreadRadius: 1,
                                                        blurRadius: 2),
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withAlpha(50),
                                                        offset: Offset(-1, -1),
                                                        spreadRadius: 1,
                                                        blurRadius: 2),
                                                  ]),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 1.h),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 9.h,
                                                          width: 18.w,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                "https:${provider.allProductModel!.data!.posts![index].preview?.media?.url}",
                                                            fit: BoxFit.contain,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Center(
                                                              child: CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      1.5,
                                                                  value: downloadProgress
                                                                      .progress),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                Image.network(
                                                                    'https://octanefashion.dialboxx.com/uploads/default.png'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Expanded(
                                                            child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${provider.allProductModel!.data!.posts![index].title}',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff3E3E3E),
                                                                      fontSize:
                                                                          10.sp),
                                                                ),
                                                                Text(
                                                                  'Created at',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff0B7A3E),
                                                                      fontSize:
                                                                          8.sp),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 0.3.h,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '(#${provider.allProductModel!.data!.posts![index].id})',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff3E3E3E),
                                                                      fontSize:
                                                                          8.5.sp),
                                                                ),
                                                                Text(
                                                                  '${timeago.format(fifteenAgo)}',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff636363),
                                                                      fontSize:
                                                                          8.sp),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'Rs:${provider.allProductModel!.data!.posts![index].price?.price}',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff636363),
                                                                      fontSize:
                                                                          9.sp),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 0.75.h,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                          text:
                                                                              'Discount: ',
                                                                          style: TextStyle(
                                                                              color: Color(0xff636363),
                                                                              fontSize: 9.sp)),
                                                                      TextSpan(
                                                                          text:
                                                                              '- ${provider.allProductModel!.data!.posts![index].price?.specialPrice ?? 0}',
                                                                          style: TextStyle(
                                                                              color: redColor,
                                                                              fontSize: 9.sp)),
                                                                    ])),
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                          text:
                                                                              'Regular price: ',
                                                                          style: TextStyle(
                                                                              color: Color(0xff636363),
                                                                              fontSize: 9.sp)),
                                                                      TextSpan(
                                                                          text:
                                                                              'Rs:${provider.allProductModel!.data!.posts![index].price?.regularPrice}',
                                                                          style: TextStyle(
                                                                              color: Color(0xff636363),
                                                                              fontSize: 9.sp)),
                                                                    ]))
                                                              ],
                                                            )
                                                          ],
                                                        ))
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
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              EditProductScreen(
                                                                        productId:
                                                                            '${provider.allProductModel!.data!.posts![index].id.toString()}',
                                                                      ),
                                                                    ));
                                                              },
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/svgs/settng.svg',
                                                                height: 2.7.h,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/svgs/eyess.svg',
                                                              height: 2.7.h,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/svgs/scale.svg',
                                                              height: 2.5.h,
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Text(
                                                              'Sale: ${provider.allProductModel!.data!.posts![index].orderCount}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      9.sp),
                                                            ),
                                                          ],
                                                        ),
                                                        if (provider
                                                                .allProductModel!
                                                                .data!
                                                                .posts![index]
                                                                .price
                                                                ?.pstatus ==
                                                            1)
                                                          Container(
                                                            color: blueColor,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          3.w,
                                                                      vertical:
                                                                          0.3.h),
                                                              child: Text(
                                                                'Active',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10.sp),
                                                              ),
                                                            ),
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
                                      ),
                                    );
                                  },
                                ),
                              ))
              ],
            ),
          ),
          Positioned(
            bottom: 1.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(),));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProductScreen(),
                      ));
                },
                child: Container(
                  height: 5.5.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff005493),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Add New Product',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 1.h,
          //   child: Padding(
          //     padding:  EdgeInsets.symmetric(horizontal: 5.w),
          //     child: GestureDetector(
          //       onTap: () {
          //        // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderScreen(),));
          //       },
          //       child: Container(
          //         height: 5.5.h,
          //         width: 90.w,
          //         decoration: BoxDecoration(
          //           color: Color(0xff505050),
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         child: Center(
          //           child: Text(
          //             'Add Product in Bulk',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 13.sp,
          //                 fontWeight: FontWeight.bold
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
