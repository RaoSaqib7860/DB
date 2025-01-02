import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../edit_product/edit_product.dart';
import '../edit_product/edit_product_screen/inventory_screen.dart';
import '../product_categories_screen/create_category_screen.dart';
import '../product_categories_screen/product_categories_screen.dart';
import 'Provider/inventory_provider.dart';

class TotalInventoryScreen extends StatefulWidget {
  final int? index;
  const TotalInventoryScreen({Key? key, this.index}) : super(key: key);

  @override
  State<TotalInventoryScreen> createState() => _TotalInventoryScreenState();
}

class _TotalInventoryScreenState extends State<TotalInventoryScreen> {
  TextEditingController productController = TextEditingController();
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';
  @override
  void initState() {
    get_invenntory();
    super.initState();
  }

  get_invenntory() async {
    final GetInventoryProvider provider =
        Provider.of<GetInventoryProvider>(context, listen: false);
    await provider.get_inventoryApi(map: {
      'user_id': '${user_model.data!.userId}',
      'domain_id': '${user_model.data!.domainId}'
    });
    inventory_loading = false;
    setState(() {});
  }

  bool inventory_loading = true;
  @override
  Widget build(BuildContext context) {
    final GetInventoryProvider provider =
        Provider.of<GetInventoryProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: DataLoading(
        isLoading: inventory_loading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                "Font Family",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
                            'Submit',
                            style:
                                TextStyle(fontSize: 9.sp, color: Colors.white),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              height: 4.5.h,
              width: 100.w,
              child: TextField(
                style: TextStyle(fontSize: 12.sp),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3)),
                  hintText: 'Search Products',
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
                child: inventory_loading
                    ? SizedBox()
                    : provider.getInvontoryModel?.data?.length == 0
                        ? Center(
                            child: Text('No Data'),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await provider.get_inventoryApi(map: {
                                'user_id': '${user_model.data!.userId}',
                                'domain_id': '${user_model.data!.domainId}'
                              });
                            },
                            child: ListView.builder(
                              itemCount:
                                  provider.getInvontoryModel?.data?.length ?? 0,
                              padding: EdgeInsets.only(bottom: 12.h),
                              itemBuilder: (context, index) {
                                if (widget.index == 1 &&
                                    provider.getInvontoryModel!.data![index]
                                            .stockManage !=
                                        1) {
                                  return SizedBox();
                                }
                                if (widget.index == 2 &&
                                    provider.getInvontoryModel!.data![index]
                                            .stockManage ==
                                        1) {
                                  return SizedBox();
                                }
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InventoryScreen(
                                            type: '0',
                                            productId: provider
                                                .getInvontoryModel!
                                                .data![index]
                                                .termId
                                                .toString(),
                                          ),
                                        )).then((value) {
                                      provider.get_inventoryApi(map: {
                                        'user_id': '${user_model.data!.userId}',
                                        'domain_id':
                                            '${user_model.data!.domainId}'
                                      });
                                    });
                                  },
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
                                                horizontal: 2.w, vertical: 1.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 9.h,
                                                      width: 40.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              "https:${provider.getInvontoryModel?.data?[index].term?.preview?.media!.url ?? ''}",
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
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0.5.h),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${provider.getInvontoryModel!.data![index].term!.title}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  color: Color(
                                                                      0xff3E3E3E)),
                                                            ),
                                                            SizedBox(
                                                              height: 1.1.h,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                          text:
                                                                              'SKU: ',
                                                                          style: TextStyle(
                                                                              color: Color(0xff3E3E3E),
                                                                              fontSize: 9.sp)),
                                                                      TextSpan(
                                                                          text:
                                                                              '${provider.getInvontoryModel!.data![index].sku ?? ''} ',
                                                                          style: TextStyle(
                                                                              color: Color(0xff3E3E3E).withAlpha(200),
                                                                              fontSize: 9.sp)),
                                                                      TextSpan(
                                                                          text:
                                                                              '',
                                                                          style: TextStyle(
                                                                              color: Color(0xff3E3E3E).withAlpha(200),
                                                                              fontSize: 9.sp,
                                                                              decoration: TextDecoration.lineThrough))
                                                                    ])),
                                                                Text(
                                                                  provider.getInvontoryModel!.data![index]
                                                                              .stockStatus ==
                                                                          1
                                                                      ? 'In Stock'
                                                                      : 'Out Of Stock',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          8.sp,
                                                                      color: Color(
                                                                          0xff0B7A3E)),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 0.8.h,
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
                                                                              'STOCK MANAGE: ',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 8.sp)),
                                                                      TextSpan(
                                                                          text: provider.getInvontoryModel!.data![index].stockManage == 1
                                                                              ? 'Yes'
                                                                              : 'No',
                                                                          style: TextStyle(
                                                                              color: redColor,
                                                                              fontSize: 8.sp)),
                                                                    ])),
                                                                FlutterSwitch(
                                                                  activeColor:
                                                                      Color(
                                                                          0xff0B7A3E),
                                                                  inactiveColor:
                                                                      Color(
                                                                          0xff484848),
                                                                  width: 10.w,
                                                                  height: 2.7.h,
                                                                  valueFontSize:
                                                                      25.0,
                                                                  toggleSize:
                                                                      2.3.h,
                                                                  value: provider
                                                                              .getInvontoryModel!
                                                                              .data![index]
                                                                              .stockStatus ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                                  borderRadius:
                                                                      30.0,
                                                                  padding: 1,
                                                                  onToggle:
                                                                      (val) async {
                                                                    if (val) {
                                                                      provider
                                                                          .getInvontoryModel!
                                                                          .data![
                                                                              index]
                                                                          .stockStatus = 1;
                                                                      setState(
                                                                          () {});
                                                                      await DataProvider()
                                                                          .inventoryInfoUpdateApi(
                                                                              map: {
                                                                            'user_id':
                                                                                '${user_model.data!.userId}',
                                                                            'product_id':
                                                                                '${provider.getInvontoryModel!.data![index].termId}',
                                                                            'stock_status':
                                                                                '1',
                                                                            'stock_qty':
                                                                                '${provider.getInvontoryModel!.data![index].stockQty}'
                                                                          });
                                                                      // provider.get_inventoryApi(
                                                                      //     map: {
                                                                      //       'user_id':
                                                                      //           '${user_model.data!.userId}',
                                                                      //       'domain_id':
                                                                      //           '${user_model.data!.domainId}',
                                                                      //     },
                                                                      //     load:
                                                                      //         false);
                                                                    } else {
                                                                      provider
                                                                          .getInvontoryModel!
                                                                          .data![
                                                                              index]
                                                                          .stockStatus = 0;
                                                                      setState(
                                                                          () {});
                                                                      await DataProvider()
                                                                          .inventoryInfoUpdateApi(
                                                                              map: {
                                                                            'user_id':
                                                                                '${user_model.data!.userId}',
                                                                            'product_id':
                                                                                '${provider.getInvontoryModel!.data![index].termId}',
                                                                            'stock_status':
                                                                                '0',
                                                                            'stock_qty':
                                                                                '${provider.getInvontoryModel!.data![index].stockQty}'
                                                                          });
                                                                      // provider.get_inventoryApi(
                                                                      //     map: {
                                                                      //       'user_id':
                                                                      //           '${user_model.data!.userId}',
                                                                      //       'domain_id':
                                                                      //           '${user_model.data!.domainId}',
                                                                      //     },
                                                                      //     load:
                                                                      //         false);
                                                                    }
                                                                  },
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
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
                                                        SvgPicture.asset(
                                                          'assets/svgs/scale.svg',
                                                          height: 2.5.h,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                          'Quantity',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10.sp),
                                                        ),
                                                      ],
                                                    ),
                                                    if (provider
                                                            .getInvontoryModel!
                                                            .data![index]
                                                            .stockManage ==
                                                        1)
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              provider
                                                                  .getInvontoryModel!
                                                                  .data![index]
                                                                  .stockQty = provider
                                                                      .getInvontoryModel!
                                                                      .data![
                                                                          index]
                                                                      .stockQty! -
                                                                  1;
                                                              setState(() {});
                                                              await DataProvider()
                                                                  .inventoryInfoUpdateApi(
                                                                      map: {
                                                                    'user_id':
                                                                        '${user_model.data!.userId}',
                                                                    'product_id':
                                                                        '${provider.getInvontoryModel!.data![index].termId}',
                                                                    'stock_status':
                                                                        '1',
                                                                    'stock_qty':
                                                                        '${provider.getInvontoryModel!.data![index].stockQty}'
                                                                  });
                                                              provider
                                                                  .get_inventoryApi(
                                                                      map: {
                                                                    'user_id':
                                                                        '${user_model.data!.userId}',
                                                                    'domain_id':
                                                                        '${user_model.data!.domainId}',
                                                                  },
                                                                      load:
                                                                          false);
                                                            },
                                                            icon: Icon(
                                                              Icons.remove,
                                                              color: Color(
                                                                  0xff050505),
                                                              size: 1.5.h,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            '${provider.getInvontoryModel!.data![index].stockQty}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 1.w,
                                                          ),
                                                          IconButton(
                                                            onPressed:
                                                                () async {
                                                              provider
                                                                  .getInvontoryModel!
                                                                  .data![index]
                                                                  .stockQty = provider
                                                                      .getInvontoryModel!
                                                                      .data![
                                                                          index]
                                                                      .stockQty! +
                                                                  1;
                                                              setState(() {});
                                                              await DataProvider()
                                                                  .inventoryInfoUpdateApi(
                                                                      map: {
                                                                    'user_id':
                                                                        '${user_model.data!.userId}',
                                                                    'product_id':
                                                                        '${provider.getInvontoryModel!.data![index].termId}',
                                                                    'stock_status':
                                                                        '1',
                                                                    'stock_qty':
                                                                        '${provider.getInvontoryModel!.data![index].stockQty}'
                                                                  });
                                                              provider
                                                                  .get_inventoryApi(
                                                                      map: {
                                                                    'user_id':
                                                                        '${user_model.data!.userId}',
                                                                    'domain_id':
                                                                        '${user_model.data!.domainId}',
                                                                  },
                                                                      load:
                                                                          false);
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xff050505),
                                                              size: 1.5.h,
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
