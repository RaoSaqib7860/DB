import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/cupertino_alert_dialog.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../povider/delivery_provider.dart';
import 'delivery_add_update_screen/delivery_location_add.dart';

class DeliveryLocationScreen extends StatefulWidget {
  const DeliveryLocationScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryLocationScreen> createState() => _DeliveryLocationScreenState();
}

class _DeliveryLocationScreenState extends State<DeliveryLocationScreen> {
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';
  int ind = 0;

  @override
  void initState() {
    final DeliveryProvider provider =
        Provider.of<DeliveryProvider>(context, listen: false);
    provider.delivery_locationApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DeliveryProvider provider = Provider.of<DeliveryProvider>(context);
    return DataLoading(
      isLoading: provider.location_loading,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 2.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 2.w),
              //   child: Container(
              //     height: 3.5.h,
              //     width: 50.w,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(7),
              //         border: Border.all(color: Colors.grey, width: 1)),
              //     child: Row(
              //       children: [
              //         Container(
              //           height: 3.h,
              //           width: 33.w,
              //           child: Center(
              //             child: Padding(
              //               padding:
              //                   EdgeInsets.only(left: 2.w, right: 1.w),
              //               child: DropdownButton(
              //                 isExpanded: true,
              //                 underline: Container(),
              //                 icon: Icon(
              //                   Icons.keyboard_arrow_down_outlined,
              //                   size: 2.h,
              //                   color: Colors.black,
              //                 ),
              //                 value: dropdownvalue,
              //                 items: items.map((String items) {
              //                   return DropdownMenuItem(
              //                     value: items,
              //                     child: Text(
              //                       items,
              //                       style: TextStyle(
              //                           fontSize: 8.sp,
              //                           color: Colors.black),
              //                     ),
              //                   );
              //                 }).toList(),
              //                 onChanged: (String? newValue) {
              //                   setState(() {
              //                     dropdownvalue = newValue!;
              //                   });
              //                 },
              //                 hint: Text(
              //                   "Font Family",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //             child: Container(
              //           decoration: BoxDecoration(
              //             color: blueColor,
              //             borderRadius: BorderRadius.only(
              //                 topRight: Radius.circular(6),
              //                 bottomRight: Radius.circular(6)),
              //           ),
              //           child: Center(
              //             child: Text(
              //               'Submit',
              //               style: TextStyle(
              //                   fontSize: 8.sp, color: Colors.white),
              //             ),
              //           ),
              //         ))
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: provider.location_loading
                    ? SizedBox()
                    : RefreshIndicator(
                        onRefresh: () async {
                          await provider.delivery_locationApi(map: {
                            'user_id': '${user_model.data!.userId}',
                          });
                        },
                        child: ListView.builder(
                          itemCount:
                              provider.deliveryLocationModel?.data?.length ?? 0,
                          padding: EdgeInsets.only(bottom: 12.h),
                          itemBuilder: (context, index) {
                            final fifteenAgo = DateTime.parse(
                                '${provider.deliveryLocationModel?.data?[index].createdAt}');
                            return Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 1.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            "Delivery Location:",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.sp),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${provider.deliveryLocationModel?.data?[index].name}",
                                                style: TextStyle(
                                                    color: Color(0xff005493),
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "CREATED AT",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.6.h,
                                                  ),
                                                  Container(
                                                    color: Color(0xffF0C9D0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.w,
                                                              vertical: 0.2.h),
                                                      child: Text(
                                                        '${timeago.format(fifteenAgo)}',
                                                        style: TextStyle(
                                                            color: redColor,
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Divider(
                                            thickness: 0.8,
                                            color: Color(0xff707070),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                            builder: (c) =>
                                                                DeliveryLocationAdd(
                                                                  city_id: provider
                                                                      .deliveryLocationModel
                                                                      ?.data?[
                                                                          index]
                                                                      .id,
                                                                  city_name:
                                                                      '${provider.deliveryLocationModel?.data?[index].name}',
                                                                ),
                                                            fullscreenDialog:
                                                                true))
                                                        .then((value) async {
                                                      var data =
                                                          await DataProvider()
                                                              .delivery_locationApi(
                                                                  map: {
                                                            'user_id':
                                                                '${user_model.data!.userId}',
                                                          });
                                                      provider.deliveryLocationModel =
                                                          data;
                                                      setState(() {});
                                                    });
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/svgs/action.svg',
                                                    height: 3.h,
                                                  )),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                "Action",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10.sp),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    show_cupertinoDialog(
                                                        context: context,
                                                        title: 'Delete',
                                                        subtitle:
                                                            'Are you sure you want to delete?',
                                                        no_subtitle: 'No',
                                                        yes_title: "Yes",
                                                        on_done: () {
                                                          DataProvider()
                                                              .delivery_locationApi_crud(
                                                                  map: {
                                                                'user_id':
                                                                    user_model
                                                                        .data!
                                                                        .id
                                                                        .toString(),
                                                                'method':
                                                                    'delete',
                                                                'city_id': provider
                                                                    .deliveryLocationModel
                                                                    ?.data?[
                                                                        index]
                                                                    .id
                                                                    .toString()
                                                              });
                                                          provider
                                                              .deliveryLocationModel
                                                              ?.data
                                                              ?.removeAt(index);
                                                          setState(() {});
                                                        });
                                                  },
                                                  child: const Icon(
                                                    CupertinoIcons.delete,
                                                    color: Colors.red,
                                                  ))
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
                      ),
              ))
            ],
          ),
          Positioned(
            bottom: 2.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (c) => DeliveryLocationAdd(),
                          fullscreenDialog: true))
                      .then((value) async {
                    var data = await DataProvider().delivery_locationApi(map: {
                      'user_id': '${user_model.data!.userId}',
                    });
                    provider.deliveryLocationModel = data;
                    setState(() {});
                  });
                },
                child: Container(
                  height: 5.5.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Create Location',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
