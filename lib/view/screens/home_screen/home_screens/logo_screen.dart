import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../api_repository/api_utils.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Models/store_status_model.dart';
import '../Update Store Setup/update_store_provider.dart';

class LogoScreen extends StatefulWidget {
  final bool? from_account;
  const LogoScreen({Key? key, this.from_account = false}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class _LogoScreenState extends State<LogoScreen> {
  StoreStatusModel? storeStatusModel;
  Future check_store_status() async {
    storeStatusModel = await DataProvider()
        .check_logoApi(map: {'user_id': user_model.data!.userId.toString()});
    setState(() {});
  }

  @override
  void initState() {
    if (widget.from_account == true) {
      check_store_status();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UpdateStoreProvider provider =
        Provider.of<UpdateStoreProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 7.h,
                    width: 100.w,
                    color: blueColor,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/back_arrow.svg',
                                height: 2.h,
                              )),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            'Logo'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  'Store Logo'.tr,
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 7.h,
                                  width: 14.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: provider.logoImage == null
                                      ? storeStatusModel == null
                                          ? Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 4.h,
                                                color: blueColor,
                                              ),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  "${storeStatusModel?.location?.logo}",
                                              fit: BoxFit.cover,
                                              cacheKey: getRandomString(15),
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        strokeWidth: 1.5,
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.network(
                                                      'https://octanefashion.dialboxx.com/uploads/default.png'),
                                            )
                                      : Image.file(
                                          File(provider.logoImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                SizedBox(
                                  height: 1.3.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.upload_logo_Image();
                                  },
                                  child: Text(
                                    'Update Store Logo'.tr,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: blueColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  'favIcons'.tr,
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  height: 7.h,
                                  width: 14.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Color(0xff707070)),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: provider.favImage == null
                                      ? storeStatusModel == null
                                          ? Center(
                                              child: Icon(
                                                Icons.image,
                                                size: 4.h,
                                                color: blueColor,
                                              ),
                                            )
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  "${storeStatusModel?.location?.favicon}",
                                              fit: BoxFit.cover,
                                              //cacheKey: getRandomString(14),
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        strokeWidth: 1.5,
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.network(
                                                      'https://octanefashion.dialboxx.com/uploads/default.png'),
                                            )
                                      : Image.file(
                                          File(provider.favImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                SizedBox(
                                  height: 1.3.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.upload_fav_Image();
                                  },
                                  child: Text(
                                    'Update favIcons'.tr,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: blueColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
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
                ],
              ),
              Positioned(
                  bottom: 4.h,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: GestureDetector(
                      onTap: () async {
                        await provider.post_Images_data();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 5.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: redColor),
                        child: Center(
                          child: Text(
                            'Save'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
