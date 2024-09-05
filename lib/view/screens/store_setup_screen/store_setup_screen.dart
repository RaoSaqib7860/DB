import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_model_globle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../../custom_widgets/web_view.dart';
import '../../../utils_services/storage_util.dart';
import '../auth_screens/login_screen/Model/login_model.dart';
import '../auth_screens/login_screen/login_screen.dart';
import '../bottom_sheet/bottom_sheet.dart';
import '../payment_screen/payment_screen.dart';
import '../product_screens/add_product_screen/add_product_screen.dart';

class StoreSetupScreen extends StatefulWidget {
  StoreSetupScreen({Key? key}) : super(key: key);

  @override
  State<StoreSetupScreen> createState() => _StoreSetupScreenState();
}

class _StoreSetupScreenState extends State<StoreSetupScreen> {
  @override
  void initState() {
    get_storage();
    super.initState();
  }

  LoginModel? loginModel;
  int? is_product;
  int? is_payment;
  get_storage() async {
    var data = await storage.read('userData');
    print('${data}');
    loginModel = LoginModel.fromJson(data);
    is_product = loginModel!.data!.isProduct;
    is_payment = loginModel!.data!.isPaymentMethod;
    print('${loginModel!.toJson()}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 100.w,
                height: 50.h,
                color: blueColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 9.h,
                    ),
                    CircularPercentIndicator(
                      radius: 5.3.h,
                      animation: true,
                      lineWidth: 1.w,
                      percent: 0.25,
                      center: Text(
                        '25%',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp),
                      ),
                      circularStrokeCap: CircularStrokeCap.square,
                      progressColor: redColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Store setup is Complete'.tr,
                      style: TextStyle(color: Colors.white, fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Finish following steps to unlock features '.tr,
                      style: TextStyle(color: Colors.white, fontSize: 13.sp),
                    )
                  ],
                ),
              )
            ],
          ),
          if (loginModel != null)
            Positioned(
              top: 30.h,
              left: 5.w,
              child: Container(
                width: 90.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4.h,
                            width: 8.w,
                            decoration: BoxDecoration(
                                color: blueColor, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 3.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Created Online Store'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Congratulations on Opening your\nnew online store!'
                                    .tr,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(WebView(
                                    url: '${user_model.data!.fullDomain}',
                                  ));
                                },
                                child: Text(
                                  'Visit Store.'.tr,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: blueColor,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationColor: blueColor,
                                      height: 0.14.h,
                                      decorationThickness: 0.3.h
                                      //fontWeight: FontWeight.w500
                                      ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          is_product == 1
                              ? Container(
                                  height: 4.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      color: blueColor, shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 3.h,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 4.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD6EDFF),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: blueColor, width: 1)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: blueColor,
                                        // fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Add Product'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: blueColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Set up your first product by adding\nthe product name and image.'
                                    .tr,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(
                                height: 0.6.h,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddProductScreen(
                                          from_first_add: true,
                                        ),
                                      )).then((value) {
                                    get_storage();
                                  });
                                },
                                child: Container(
                                  color: blueColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.5.h),
                                    child: Text(
                                      'Add Product'.tr,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          is_payment == 1
                              ? Container(
                                  height: 4.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      color: blueColor, shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 3.h,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 4.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xffD6EDFF),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: blueColor, width: 1)),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: blueColor,
                                        // fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Setup Payment Method'.tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: blueColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 0.4.h,
                              ),
                              Text(
                                'Choose how you would like to\nreceive payment for your orders.'
                                    .tr,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  //fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(
                                height: 0.6.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentScreen(),
                                      )).then((value) {
                                    get_storage();
                                  });
                                },
                                child: Container(
                                  color: blueColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.5.h),
                                    child: Text(
                                      'Setup Now'.tr,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        //fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (loginModel != null)
            Positioned(
                bottom: 2.h,
                left: 5.w,
                child: InkWell(
                  onTap: () {
                    if (is_payment == 1 && is_product == 1) {
                      Get.offAll(BottomSheetScreen());
                    } else {
                      Get.snackbar('Alert'.tr, 'Please complete all steps.'.tr);
                    }
                  },
                  child: Container(
                    height: 5.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Complete your Store Setup'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                  ),
                )),
          Positioned(
              top: 5.h,
              left: 5.w,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.offAll(LoginScreen());
                },
              ))
        ],
      ),
    );
  }
}
