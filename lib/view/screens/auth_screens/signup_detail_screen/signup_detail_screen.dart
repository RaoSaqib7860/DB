import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../login_screen/login_screen.dart';
import 'SignUp Provider/sign_up_provider.dart';

class SignUpDetailScreen extends StatefulWidget {
  SignUpDetailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpDetailScreen> createState() => _SignUpDetailScreenState();
}

class _SignUpDetailScreenState extends State<SignUpDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpProvider provider = Provider.of<SignUpProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 9.h,
                  ),
                  Image(
                    image: AssetImage('assets/images/app_logo.png'),
                    height: 6.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Enter Business Details'.tr,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    hintText: 'Enter Email'.tr,
                    controller: provider.emailController,
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Business Name *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    hintText: 'Enter Business Name'.tr,
                    controller: provider.businessNameController,
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Mobile Number *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    hintText: 'Enter mobile number'.tr,
                    controller: provider.mobileController,
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select Category *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height: 85.h,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                                    child: Scaffold(
                                      body: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 3.h),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Select Category'.tr,
                                                style: TextStyle(
                                                    color: blueColor,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Expanded(
                                                  child: SingleChildScrollView(
                                                child: Column(
                                                    children: provider
                                                        .list_of_category
                                                        .map((e) {
                                                  return InkWell(
                                                    child: provider
                                                                .selected_categgory ==
                                                            e
                                                        ? selected_checkboxContainer(
                                                            text: '$e')
                                                        : checkboxContainer(
                                                            text: '$e'.tr),
                                                    onTap: () {
                                                      provider
                                                          .selected_categgory = e;
                                                      setState(() {});
                                                    },
                                                  );
                                                }).toList()),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      bottomNavigationBar: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 4.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (provider.selected_categgory !=
                                                  null) {
                                                selected_checkboxContainer(
                                                    text: provider
                                                        .selected_categgory!);
                                                provider.updateState();
                                              }

                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: blueColor),
                                              child: Center(
                                                child: Text(
                                                  'Save'.tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 4.5.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                        provider.selected_categgory != null
                                            ? provider.selected_categgory!
                                            : 'Select business industry'.tr,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 11.sp)),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.black54,
                                size: 3.5.h,
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Select Subscription *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    height: 4.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('E-commerce'.tr,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 11.sp)),
                            // Icon(
                            //   Icons.keyboard_arrow_down_outlined,
                            //   color: Colors.black54,
                            //   size: 3.5.h,
                            // ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Create Domain *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    height: 4.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      children: [
                        Container(
                          width: 55.w,
                          height: 4.5.h,
                          child: TextField(
                            style: TextStyle(fontSize: 12.sp),
                            textAlign: TextAlign.right,
                            controller: provider.domainController,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  borderSide: BorderSide.none),
                              hintText: 'business name'.tr,
                              hintStyle: TextStyle(
                                  fontSize: 11.sp, color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  top: 0.5.h, left: 2.w, right: 2.w),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                height: 4.5.h,
                                width: 0.4.w,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                '.dialboxx.com',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.black.withAlpha(200)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Password *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    obsecureText: true,
                    hintText: 'Enter Password'.tr,
                    controller: provider.passwordController,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Confirm Password *'.tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    obsecureText: true,
                    hintText: 'Enter Confirm Password'.tr,
                    controller: provider.cPasswordController,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.checkboxSelected = !provider.checkboxSelected!;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        if (provider.checkboxSelected == true)
                          SvgPicture.asset(
                            'assets/svgs/tickss.svg',
                            height: 2.5.h,
                          ),
                        if (provider.checkboxSelected == false)
                          SvgPicture.asset(
                            'assets/svgs/empty_checkbox.svg',
                            height: 2.5.h,
                          ),
                        SizedBox(
                          width: 2.w,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'I agree with the  '.tr,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp)),
                          TextSpan(
                              text: 'term '.tr,
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 12.sp,
                                //fontWeight: FontWeight.bold
                              )),
                          TextSpan(
                              text: 'and '.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                //fontWeight: FontWeight.bold
                              )),
                          TextSpan(
                              text: 'conditions'.tr,
                              style: TextStyle(
                                color: blueColor,
                                fontSize: 12.sp,
                              ))
                        ])),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider.passwordController.text ==
                          provider.cPasswordController.text) {
                        if (provider.emailController.text.isNotEmpty) {
                          if (provider.businessNameController.text.isNotEmpty) {
                            if (provider.domainController.text.isNotEmpty) {
                              if (provider.mobileController.text.isNotEmpty) {
                                if (provider
                                    .passwordController.text.isNotEmpty) {
                                  if (provider.selected_categgory != null) {
                                    if (provider.checkboxSelected == true) {
                                      if (validateEmail(
                                          provider.emailController.text)) {
                                        provider.sign_up_api(context);
                                      } else {
                                        Get.snackbar('Alert'.tr,
                                            'Email is not valid.'.tr);
                                      }
                                    } else {
                                      Get.snackbar(
                                          'Alert'.tr,
                                          'You must accept the term and conditions to register an account.'
                                              .tr);
                                    }
                                  } else {
                                    Get.snackbar(
                                        'Alert'.tr, 'Category is empty.'.tr);
                                  }
                                } else {
                                  Get.snackbar(
                                      'Alert'.tr, 'Password is empty.'.tr);
                                }
                              } else {
                                Get.snackbar(
                                    'Alert'.tr, 'Mobile number is empty.'.tr);
                              }
                            } else {
                              Get.snackbar('Alert'.tr, 'Domain is empty.'.tr);
                            }
                          } else {
                            Get.snackbar(
                                'Alert'.tr, 'Business Name is empty.'.tr);
                          }
                        } else {
                          Get.snackbar('Alert'.tr, 'Email is empty.'.tr);
                        }
                      } else {
                        Get.snackbar('Alert'.tr, 'Password not matched.'.tr);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: blueColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.7.h, horizontal: 14.w),
                        child: Text(
                          'Next'.tr,
                          style:
                              TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkboxContainer({String? text}) {
    return Column(
      children: [
        Container(
          color: Colors.blue.withAlpha(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/empty_circle.svg',
                      height: 1.6.h,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      width: 65.w,
                      child: Text(
                        text!,
                        style: TextStyle(
                            color: Color(0xff727272),
                            fontSize: 10.sp,
                            height: 0.16.h),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  'assets/svgs/$text.svg',
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }

  Widget selected_checkboxContainer({String? text}) {
    return Column(
      children: [
        Container(
          color: Colors.blue.withAlpha(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(1.2),
                          child: SvgPicture.asset(
                            'assets/svgs/fill_circle.svg',
                            height: 1.3.h,
                          ),
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      width: 65.w,
                      child: Text(
                        text!,
                        style: TextStyle(
                            color: Color(0xff727272),
                            fontSize: 10.sp,
                            height: 0.16.h),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  'assets/svgs/$text.svg',
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }

  bool validateEmail(String value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value.isNotEmpty && !regex.hasMatch(value) ? false : true;
  }
}
