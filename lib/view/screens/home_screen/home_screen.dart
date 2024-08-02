import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api_repository/api_utils.dart';
import '../../../utils_services/storage_util.dart';
import '../account_screen/domain_setting_screen/domain_setting_screen.dart';
import '../auth_screens/login_screen/Model/login_model.dart';
import 'DashBoard Provider/dashboard_provider.dart';
import 'home_screens/logo_screen.dart';
import 'home_screens/website_design_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _value = false;
  final List<String> _imageUrls = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png'
  ];

  @override
  void initState() {
    super.initState();
    final HomePageProvider provider =
        Provider.of<HomePageProvider>(context, listen: false);
    provider.get_dashboard_data();
    get_storage();
  }

  LoginModel? loginModel;
  get_storage() async {
    var data = await storage.read('userData');
    print('${data}');
    loginModel = LoginModel.fromJson(data);
    if (loginModel!.data!.onOff == 1) {
      _value = true;
    } else {
      _value = false;
    }
    setState(() {});
  }

  int active_scrool = 0;

  @override
  Widget build(BuildContext context) {
    final HomePageProvider provider = Provider.of<HomePageProvider>(context);

    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: provider.loading
            ? SizedBox()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 100.w,
                          color: loginModel!.data!.onOff == 1
                              ? Color(0xff079F5D)
                              : redColor,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.w, right: 4.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Welcome ${loginModel!.data!.name}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        loginModel!.data!.onOff == 1
                                            ? 'Online'
                                            : 'Offline',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: FlutterSwitch(
                                          toggleColor:
                                              loginModel!.data!.onOff == 1
                                                  ? Color(0xff0B7A3E)
                                                  : redColor,
                                          width: 10.w,
                                          height: 2.7.h,
                                          valueFontSize: 25.0,
                                          toggleSize: 2.5.h,
                                          value: _value,
                                          borderRadius: 30.0,
                                          padding: 1,
                                          showOnOff: false,
                                          inactiveColor: Color(0xffD2D2D2),
                                          activeColor: Color(0xffD2D2D2),
                                          onToggle: (val) {
                                            if (val) {
                                              loginModel!.data!.onOff = 1;
                                              storage.write('userData',
                                                  loginModel!.toJson());
                                              DataProvider()
                                                  .storeOnOffApi(map: {
                                                "user_id": loginModel!.data!.id
                                                    .toString(),
                                                "id": '1'
                                              });
                                            } else {
                                              loginModel!.data!.onOff = 2;
                                              storage.write('userData',
                                                  loginModel!.toJson());
                                              DataProvider()
                                                  .storeOnOffApi(map: {
                                                "user_id": loginModel!.data!.id
                                                    .toString(),
                                                "id": '2'
                                              });
                                            }
                                            setState(() {
                                              _value = val;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.1.h,
                        ),
                        Container(
                          height: 20.h,
                          child: Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                    height: 20.h,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    onPageChanged: (a, b) {
                                      print('$a');
                                      if (mounted) {
                                        active_scrool = a;
                                        setState(() {});
                                      }
                                    },
                                    autoPlayAnimationDuration:
                                        Duration(seconds: 2),
                                    autoPlayInterval: Duration(seconds: 6)),
                                items: _imageUrls.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 20.h,
                                        child: Image.asset(
                                          '$i',
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: _imageUrls.map((e) {
                                      if (_imageUrls.indexOf(e) ==
                                          active_scrool) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          child: SvgPicture.asset(
                                              height: 1.h,
                                              'assets/svgs/extra_fill_dot.svg'),
                                        );
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          child: SvgPicture.asset(
                                              height: 0.7.h,
                                              'assets/svgs/fill_dot.svg'),
                                        );
                                      }
                                    }).toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                  horizontal: 3.w, vertical: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/link.svg',
                                        height: 2.4.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        'Share store link',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    'Customer can visit the following link and place their orders.',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        height: 0.17.h),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (!await launchUrl(Uri.parse(
                                          'https://${loginModel!.data!.domain}'))) {
                                        throw Exception(
                                            'Could not launch ${'https://${loginModel!.data!.domain}'}');
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'https://${loginModel!.data!.domain}',
                                          style: TextStyle(
                                              fontSize: 9.7.sp,
                                              color: blueColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        SvgPicture.asset(
                                          'assets/svgs/fold.svg',
                                          height: 2.3.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Share.share(
                                          'Asallam-o-Alikum!\n\nYou can now order online from ${loginModel?.data?.name} using the following link: https://${loginModel?.data?.domain}\n\nIf you need any assistance with your online order, please contact us at ${loginModel?.data?.email}.\n\nThank you!');
                                    },
                                    child: Row(
                                      children: [
                                        Text('Share your Domain '),
                                        Icon(
                                          CupertinoIcons.share,
                                          color: Color(0xff1568A8),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DomainSettingScreen(),
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 0.4.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Get your custom domain',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              SvgPicture.asset(
                                                'assets/svgs/dropright.svg',
                                                height: 1.5.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                  horizontal: 2.w, vertical: 0.6.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Earnings performance',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 9.sp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                    height: 20.h,
                                    child: AspectRatio(
                                      aspectRatio: 1.5,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(show: false),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(0, 3),
                                                FlSpot(1, 1),
                                                FlSpot(2, 4),
                                                FlSpot(3, 2),
                                                FlSpot(4, 5),
                                              ],
                                              isCurved: true,
                                              colors: [Colors.blue],
                                              belowBarData:
                                                  BarAreaData(show: false),
                                              dotData: FlDotData(show: false),
                                            ),
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(0, 1),
                                                FlSpot(1, 4),
                                                FlSpot(2, 2),
                                                FlSpot(3, 5),
                                                FlSpot(4, 3),
                                              ],
                                              isCurved: true,
                                              colors: [Colors.green],
                                              belowBarData:
                                                  BarAreaData(show: false),
                                              dotData: FlDotData(show: false),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Date',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 9.sp),
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
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Overview',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Lifetime',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //SizedBox(width: 0.1.w,),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                    size: 3.h,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                  SizedBox(
                                    height: 1.3.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Earnings - ${provider.dashboardModel!.data!.orders?.first.year}',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.black,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Show more',
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              color: blueColor,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: blueColor,
                                            size: 3.h,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${provider.dashboardModel!.data!.totalEarnings}',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/fold.svg',
                                        height: 2.3.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
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
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                  SizedBox(
                                    height: 1.3.h,
                                  ),
                                  Text(
                                    'Today\' total sales',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    '${provider.dashboardModel!.data!.todaySaleAmount}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Yesterday Sales',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    '${provider.dashboardModel!.data!.yesterdaySaleAmount}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Last 7 Days',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    '${provider.dashboardModel!.data!.lastweekSaleAmount}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'This month',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    '${provider.dashboardModel!.data!.thismonthSaleAmount}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'How to upload store logo',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: blueColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(Uri.parse(
                                'https://youtu.be/dYCJgXQ7OtA?si=CQFL4DAZRTZ4qz7G'))) {
                              throw Exception(
                                  'Could not launch ${'https://youtu.be/dYCJgXQ7OtA?si=CQFL4DAZRTZ4qz7G'}');
                            }
                          },
                          child: Container(
                            height: 20.h,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/youtube_image.jpg',
                                    fit: BoxFit.cover,
                                    height: 20.h,
                                    width: 100.w,
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    'assets/images/youtube_icon.png',
                                    fit: BoxFit.cover,
                                    height: 10.h,
                                  ),
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
                          child: Container(
                            height: 20.h,
                            width: 100.w,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
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
                                          horizontal: 4.w, vertical: 1.5.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Product Limit',
                                            style: TextStyle(
                                              color: blueColor,
                                              fontSize: 8.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  '${provider.dashboardModel!.data!.products}',
                                              style: TextStyle(
                                                color: redColor,
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '/${provider.dashboardModel!.data!.productLimit}',
                                              style: TextStyle(
                                                color: blueColor,
                                                fontSize: 8.sp,
                                              ),
                                            )
                                          ])),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          Center(
                                              child: Image(
                                            image: AssetImage(
                                                'assets/images/blue_circle.png'),
                                            height: 10.h,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Container(
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
                                          horizontal: 4.w, vertical: 1.5.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Usage Storage',
                                            style: TextStyle(
                                              color: blueColor,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  '${provider.dashboardModel!.data!.storageSize}',
                                              style: TextStyle(
                                                color: blueColor,
                                                fontSize: 8.sp,
                                              ),
                                            )
                                          ])),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          Center(
                                              child: Image(
                                            image: AssetImage(
                                                'assets/images/blue_circle.png'),
                                            height: 10.h,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  horizontal: 3.w, vertical: 1.3.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${provider.dashboardModel!.data!.willExpired}',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.w, right: 5.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Storage usage',
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              '${provider.dashboardModel!.data!.storageUsed}',
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Products',
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              '${provider.dashboardModel!.data!.products}/${provider.dashboardModel!.data!.productLimit}',
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Pages',
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              '${provider.dashboardModel!.data!.pages}',
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 5.w),
                        //   child: Container(
                        //     width: 100.w,
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(3),
                        //         boxShadow: [
                        //           BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //           BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //         ]
                        //     ),
                        //     child: Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.3.h),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             'Scan your site',
                        //             style: TextStyle(
                        //                 fontSize: 10.sp,
                        //                 color: Colors.black,
                        //                 fontWeight: FontWeight.bold
                        //             ),
                        //           ),
                        //           Center(
                        //               child: Image(
                        //                   image: AssetImage('assets/images/scaan.png'),
                        //                 height: 23.h,
                        //               )
                        //           ),
                        //           //SizedBox(height: 1.h,),
                        //           Center(
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 color: redColor,
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               child: Padding(
                        //                 padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
                        //                 child: Text(
                        //                   'Download',
                        //                   style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 10.sp
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: SingleChildScrollView(
                                  child: Container(
                                    // height: 33.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 0.8.h,
                                          ),
                                          Center(
                                              child: SvgPicture.asset(
                                            'assets/svgs/steppers.svg',
                                            height: 1.h,
                                          )),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                    size: 3.h,
                                                  )),
                                            ],
                                          ),
                                          //SizedBox(height: 1.h,),
                                          Text(
                                            'Complete Your Store Setup',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          bottomContainer(
                                            title: 'Add Store Logo',
                                            subtitle:
                                                'Online Stores with a logo get 5 times more Orders and 10 times more Store Views.',
                                            ontap: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LogoScreen(),
                                                  ));
                                            },
                                          ),
                                          bottomContainer(
                                              title: 'Add Store Information',
                                              subtitle:
                                                  'Online Stores with complete information increase customer trust by 70%'),
                                          bottomContainer(
                                              title: 'Add Pickup Location',
                                              subtitle:
                                                  'Make fulfilling orders easier by adding Pickup Location for your delivery.'),
                                          bottomContainer(
                                            title: 'Add Fix Website Design',
                                            subtitle:
                                                'Design your website by choosing layout and colors to increase your conversion rate.',
                                            ontap: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebsiteDesignScreen(),
                                                  ));
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 4.h,
                          width: 100.w,
                          color: redColor,
                          child: Center(
                            child: Text(
                              'Complete your Store Setup',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.sp),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
      ),
    );
  }

  Widget bottomContainer({String? title, String? subtitle, Function()? ontap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(color: Colors.black, fontSize: 13.sp),
            ),
            GestureDetector(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 1, color: Color(0xff6B6B6B))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.4.h),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Color(0xff6B6B6B), fontSize: 12.sp),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 19.w),
          child: Text(
            subtitle!,
            style: TextStyle(color: Color(0xff6B6B6B), fontSize: 11.5.sp),
          ),
        ),
        SizedBox(
          height: 1.5.h,
        )
      ],
    );
  }
}
