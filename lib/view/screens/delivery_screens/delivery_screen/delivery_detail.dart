import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/web_view.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../models/tcs_information_model.dart';
import 'delivery_order_screens/tcs_screen.dart';

class DeliveryDetail extends StatefulWidget {
  const DeliveryDetail({super.key});

  @override
  State<DeliveryDetail> createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  @override
  void initState() {
    get_orders();
    super.initState();
  }

  TCSInformationModel? tcsInformationModel;
  get_orders() async {
    tcsInformationModel = await DataProvider().tcs_infoApi(map: {
      'user_id': '${user_model.data!.userId}',
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: tcsInformationModel == null,
      child: Scaffold(
        body: tcsInformationModel == null
            ? SizedBox()
            : Container(
                height: 100.h,
                width: 100.w,
                child: Column(
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
                                child: Container(
                                  height: 4.h,
                                  width: 10.w,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svgs/back_arrow.svg',
                                      height: 3.h,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: 25.w,
                            ),
                            Text(
                              'Pickup Location',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Card(
                      elevation: 3,
                      child: Container(
                        width: 90.w,
                        color: Colors.white,
                        child: tcsInformationModel!.data!.isEmpty
                            ? InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => TcsScreen(),
                                  //     )).then((v) {
                                  //   get_orders();
                                  // });
                                  Get.to(WebView(
                                    url:
                                        'https://chinachase.dialboxx.com/seller/delivery/createpickup',
                                  ))!.then((v) {
                                    get_orders();
                                  });
                                },
                                child: SizedBox(
                                  height: 6.h,
                                  child: const Center(
                                    child: Text('Add Your Pickup Address.'),
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 42.w,
                                          // color: Colors.blue,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Contact Person',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].centerName}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const Text(
                                                  'Pickup Location',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].pickupAddress}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const Text(
                                                  'Postal Code',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].costCenterCode}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const Text(
                                                  'GST Number',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].accountNumber}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 25.h,
                                          width: 42.w,
                                          // color: Colors.blueGrey,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Contact Number',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].contactNumber}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  'City',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].costCenterCity}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  'Return Address',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${tcsInformationModel!.data![0].returnAddress}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Divider(
                                        height: 1.h,
                                      ),
                                    ),
                                    Container(
                                      width: 60.w,
                                      //color: Colors.redAccent,
                                      child: const Text.rich(TextSpan(
                                          text: 'Email us ',
                                          style: TextStyle(fontSize: 15),
                                          children: [
                                            TextSpan(
                                              text: 'support@dialbox.com',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue),
                                            ),
                                            TextSpan(
                                              text: 'to update Pickup Address',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ])),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
