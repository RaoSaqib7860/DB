import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../custom_widgets/app_colors.dart';
import '../../../custom_widgets/custom_bottomsheet.dart';
import '../../../custom_widgets/custom_dialogue.dart';
import '../../../custom_widgets/custom_fill_container.dart';
import '../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import 'Provider/all_order_peovider.dart';
import 'all_order_screens/all_screen.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  int? ind;
  List list = [
    'All'.tr,
    'Awaiting processing (0)'.tr,
    'Processing (0)'.tr,
    'Ready for pickup (0)'.tr,
    'Completed (0)'.tr,
    'Cancelled (0)'.tr,
    'Archived (0).'.tr
  ];
  String dropdownvalue = 'All Orders';

  @override
  Widget build(BuildContext context) {
    final AllOrderProvider provider = Provider.of<AllOrderProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 6.h,
              width: 100.w,
              color: blueColor,
              child: Center(
                child: Text(
                  'Orders'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Container(
                    height: 4.5.h,
                    width: 77.w,
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp),
                      onChanged: (v) {
                        provider.get_order_data(map: {
                          'user_id': '${user_model.data!.userId}',
                          'type': 'all',
                          'src': '${v}'
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.5),
                        ),
                        hintText: 'Search Orders e.g(#abc123)',
                        hintStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.grey),
                        contentPadding: EdgeInsets.only(
                          top: 0.5.h,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff6D6D6D),
                          size: 2.3.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            String? payment;
                            String? full_fill_payment;
                            String start_date = '';
                            String end_data = '';
                            customDialogue(
                                context: context,
                                height: 46.h,
                                content: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Apply Filter'.tr,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/svgs/cross.svg',
                                                    height: 2.5.h,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            'Filter by date'.tr,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Payment Status'.tr,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 48.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
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
                                                          offset:
                                                              Offset(-1, -1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2),
                                                    ]),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w, right: 1.w),
                                                    child: DropdownButton(
                                                      isExpanded: true,
                                                      underline: Container(),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: 2.h,
                                                        color: Colors.black,
                                                      ),
                                                      value: payment,
                                                      items: provider
                                                          .payment_status_map
                                                          .keys
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(
                                                            items,
                                                            style: TextStyle(
                                                                fontSize: 9.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          payment = newValue!;
                                                        });
                                                      },
                                                      hint: SizedBox(),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Fulfillment Status'.tr,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 48.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
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
                                                          offset:
                                                              Offset(-1, -1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2),
                                                    ]),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w, right: 1.w),
                                                    child: DropdownButton(
                                                      isExpanded: true,
                                                      underline: Container(),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: 2.h,
                                                        color: Colors.black,
                                                      ),
                                                      value: full_fill_payment,
                                                      items: provider
                                                          .full_fill_payment_status_map
                                                          .keys
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(
                                                            items,
                                                            style: TextStyle(
                                                                fontSize: 9.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          full_fill_payment =
                                                              newValue!;
                                                        });
                                                      },
                                                      hint: SizedBox(),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Starting date'.tr,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 48.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
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
                                                          offset:
                                                              Offset(-1, -1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2),
                                                    ]),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w, right: 2.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              TimePickerSpinnerPopUp(
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            timeWidgetBuilder:
                                                                (dateTime) {
                                                              return SizedBox(
                                                                width: 30.w,
                                                                child: Text(start_date
                                                                        .isEmpty
                                                                    ? 'mm/dd/yyyy'
                                                                    : start_date),
                                                              );
                                                            },
                                                            initTime:
                                                                DateTime.now(),
                                                            minTime: DateTime(
                                                                    1980)
                                                                .subtract(
                                                                    const Duration(
                                                                        days:
                                                                            10)),
                                                            maxTime:
                                                                DateTime.now(),
                                                            barrierColor: Colors
                                                                .black12, //Barrier Color when pop up show
                                                            minuteInterval: 1,
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    12,
                                                                    10,
                                                                    12,
                                                                    10),
                                                            cancelText:
                                                                'Cancel'.tr,
                                                            confirmText: 'OK',
                                                            pressType: PressType
                                                                .singlePress,
                                                            timeFormat:
                                                                'MM/dd/yyyy',
                                                            onChange:
                                                                (dateTime) {
                                                              start_date = DateFormat(
                                                                      'MM/dd/yyyy')
                                                                  .format(
                                                                      dateTime);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .calendar_today_sharp,
                                                          size: 10,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'End date'.tr,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 48.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
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
                                                          offset:
                                                              Offset(-1, -1),
                                                          spreadRadius: 1,
                                                          blurRadius: 2),
                                                    ]),
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w, right: 2.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              TimePickerSpinnerPopUp(
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            timeWidgetBuilder:
                                                                (dateTime) {
                                                              return SizedBox(
                                                                child: Text(end_data
                                                                        .isEmpty
                                                                    ? 'mm/dd/yyyy'
                                                                    : end_data),
                                                              );
                                                            },
                                                            initTime:
                                                                DateTime.now(),
                                                            minTime: DateTime(
                                                                    1980)
                                                                .subtract(
                                                                    const Duration(
                                                                        days:
                                                                            10)),
                                                            maxTime:
                                                                DateTime.now(),
                                                            barrierColor: Colors
                                                                .black12, //Barrier Color when pop up show
                                                            minuteInterval: 1,
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    12,
                                                                    10,
                                                                    12,
                                                                    10),
                                                            cancelText:
                                                                'Cancel'.tr,
                                                            confirmText:
                                                                'OK'.tr,
                                                            pressType: PressType
                                                                .singlePress,
                                                            timeFormat:
                                                                'MM/dd/yyyy',
                                                            onChange:
                                                                (dateTime) {
                                                              end_data = DateFormat(
                                                                      'MM/dd/yyyy')
                                                                  .format(
                                                                      dateTime);
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .calendar_today_sharp,
                                                          size: 10,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 7.w, right: 4.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    provider
                                                        .get_order_data(map: {
                                                      'user_id':
                                                          '${user_model.data!.userId}',
                                                      'type': 'all',
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Reset Filter'.tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (payment != null &&
                                                        full_fill_payment !=
                                                            null &&
                                                        start_date.isNotEmpty &&
                                                        end_data.isNotEmpty) {
                                                      print('request .....${{
                                                        'user_id':
                                                            '${user_model.data!.userId}',
                                                        'payment_status': provider
                                                                .payment_status_map[
                                                            payment],
                                                        'status': provider
                                                                .full_fill_payment_status_map[
                                                            full_fill_payment],
                                                        'start': start_date,
                                                        'end': end_data
                                                      }}');
                                                      provider.get_order_data(
                                                          map: {
                                                            'user_id':
                                                                '${user_model.data!.userId}',
                                                            'type':provider
                                                                .full_fill_payment_status_map[
                                                            full_fill_payment],
                                                            'payment_status':
                                                                provider.payment_status_map[
                                                                    payment],
                                                            'status': provider
                                                                    .full_fill_payment_status_map[
                                                                full_fill_payment],
                                                            'start': start_date,
                                                            'end': end_data
                                                          });
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: blueColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4.w,
                                                              vertical: 0.7.h),
                                                      child: Text(
                                                        'View Results'.tr,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ));
                          },
                          child: SvgPicture.asset(
                            'assets/svgs/comp.svg',
                            height: 2.5.h,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                height: 4.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(
                  children: [
                    Container(
                      height: 3.h,
                      width: 70.w,
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
                            items: provider.typeOrder.keys.map((String items) {
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
                              print('${provider.typeOrder[dropdownvalue]}');
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
                        child: InkWell(
                      onTap: () {
                        provider.get_order_data(map: {
                          'user_id': '${user_model.data!.userId}',
                          'type': '${provider.typeOrder[dropdownvalue]}',
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
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
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Orders'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        ind = null;
                        List typeOrder = [
                          'all'.tr,
                          'pending'.tr,
                          'processing'.tr,
                          'ready-for-pickup'.tr,
                          'completed'.tr,
                          'archived'.tr,
                          'canceled'.tr,
                        ];
                        customBottomSheet(
                            context: context,
                            widget: StatefulBuilder(
                              builder: (context, setState) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Apply Filter'.tr,
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
                                      height: 2.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ind = 0;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 0
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'All orders'.tr,
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
                                        ind = 1;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 1
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Awaiting processing '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.pending})'
                                                    .tr,
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
                                        ind = 2;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 2
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Processing '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.processing})'
                                                    .tr,
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
                                        ind = 3;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 3
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Ready for pickup '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.readyForPickup})',
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
                                        ind = 4;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 4
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Completed '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.completed})',
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
                                        ind = 5;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 5
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Archived '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.archived})',
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
                                        ind = 6;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          ind == 6
                                              ? customFillContainer()
                                              : SvgPicture.asset(
                                                  'assets/svgs/empp.svg',
                                                  height: 2.5.h,
                                                ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Cancelled '.tr +
                                                '(${provider.allOrderModel?.data?.orderCounts?.canceled})',
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
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 7.w, right: 4.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              provider.get_order_data(map: {
                                                'user_id':
                                                    '${user_model.data!.userId}',
                                                'type': 'all',
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Reset Filter'.tr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (ind != null) {
                                                provider.get_order_data(map: {
                                                  'user_id':
                                                      '${user_model.data!.userId}',
                                                  'type': '${typeOrder[ind!]}',
                                                });
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                    vertical: 0.7.h),
                                                child: Text(
                                                  'View Results'.tr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    )
                                  ],
                                );
                              },
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 0.7.h),
                          child: Text(
                            'Filter order list'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: AllScreen(),
            )
          ],
        ),
      ),
    );
  }
}
