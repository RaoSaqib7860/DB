import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../utils_services/storage_util.dart';
import '../../auth_screens/login_screen/Model/login_model.dart';

class DomainSettingScreen extends StatefulWidget {
  const DomainSettingScreen({Key? key}) : super(key: key);

  @override
  State<DomainSettingScreen> createState() => _DomainSettingScreenState();
}

class _DomainSettingScreenState extends State<DomainSettingScreen> {
  @override
  void initState() {
    get_storage();
    super.initState();
  }

  LoginModel? loginModel;
  get_storage() async {
    var data = await storage.read('userData');
    loginModel = LoginModel.fromJson(data);
    setState(() {});
  }

  TextEditingController domain_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      width: 26.w,
                    ),
                    Text(
                      'Domain Settings'.tr,
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
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Domain'.tr,
                        style: TextStyle(
                            color: blueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Text(
                        'http://${loginModel?.data?.domain}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9.5.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Container(
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
                    horizontal: 3.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Requested domain'.tr,
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    surfaceTintColor: Colors.white,
                                    contentPadding: EdgeInsets.zero,
                                    insetPadding: const EdgeInsets.all(1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    content: Builder(
                                      builder: (context) {
                                        return Container(
                                          width: 90.w,
                                          height: 26.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 4.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Add existing domain'.tr,
                                                      style: TextStyle(
                                                          color: blueColor,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2.h),
                                                        child: SvgPicture.asset(
                                                          'assets/svgs/close.svg',
                                                          height: 2.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  'Custom domain'.tr,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10.sp),
                                                ),
                                                Container(
                                                  height: 3.h,
                                                  child: TextField(
                                                    controller:
                                                        domain_controller,
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                        hintText: 'Type here'.tr,
                                                        hintStyle: TextStyle(
                                                            fontSize: 10.sp),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 1.6.h)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  'Enter the domain you want to connect.'.tr,
                                                  style: TextStyle(
                                                      color: Color(0xff8D8D8D),
                                                      fontSize: 8.sp),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (domain_controller
                                                        .text.isNotEmpty) {
                                                      DataProvider()
                                                          .domain_request_api(
                                                              map: {
                                                            'user_id':
                                                                loginModel
                                                                    ?.data?.id
                                                                    .toString(),
                                                            'domain':
                                                                '${domain_controller.text}'
                                                          });
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 20.w,
                                                    height: 3.h,
                                                    decoration: BoxDecoration(
                                                      color: blueColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Update'.tr,
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  'Configure your DNS records'.tr,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9.sp),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'You\'ll need to setup a DNS record to point to your store on our server. DNS records can be setup through your domain registrars control panel. Since every registrar has a different setup, contact them for assistance if you\'re unsure.'.tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 4,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            Color(0xff8D8D8D),
                                                        fontSize: 8.sp),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 2.h,
                              ),
                              child: SvgPicture.asset(
                                'assets/svgs/add_icons.svg',
                                height: 3.h,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
