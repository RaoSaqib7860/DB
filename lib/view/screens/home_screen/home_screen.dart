import 'dart:async';

import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/custom_bottomsheet.dart';
import '../../../custom_widgets/custom_fill_container.dart';
import '../account_screen/domain_setting_screen/domain_setting_screen.dart';
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
  int ind = 0;
  bool click = false;

  late ScrollController _scrollController;
  late Timer _timer;
  double _scrollPosition = 0.0;
  final double _scrollIncrement = 300.0;
  List<String> _imageUrls = [
    'assets/images/pic1.png',
    'assets/images/pic2.png',
    'assets/images/pic3.png',
  ];

  @override
  void initState() {
    super.initState();
    final HomePageProvider provider =
        Provider.of<HomePageProvider>(context, listen: false);
    provider.get_dashboard_data();
    _scrollController = ScrollController();

    // Start the timer when the widget is initialized
    // _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
    //     _scrollPosition = 0.0; // Start from the beginning
    //   } else {
    //     _scrollPosition += _scrollIncrement;
    //   }
    //   _scrollController.animateTo(
    //     _scrollPosition,
    //     duration: Duration(milliseconds: 50),
    //     curve: Curves.ease,
    //   );
    // });
  }

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
                          height: 8.h,
                          width: 100.w,
                          color: _value == true ? Color(0xff079F5D) : redColor,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.w, right: 4.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Welcome {Seller name}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        _value == true ? 'Online' : 'Offline',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: FlutterSwitch(
                                          toggleColor: _value == true
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
                          height: 3.h,
                        ),
                        Container(
                          //height: 30.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            //reverse: true,
                            child: Row(
                              children: _imageUrls
                                  .map((imageUrl) => Image.asset(
                                        imageUrl,
                                        fit: BoxFit.fill,
                                        height: 20.h,
                                      ))
                                  .toList(),
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
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Softmount/dialboxx.com',
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
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     color: Color(0xff47AC0E),
                                      //     borderRadius: BorderRadius.circular(5),
                                      //   ),
                                      //   child: Padding(
                                      //     padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 0.4.h),
                                      //     child: Row(
                                      //       children: [
                                      //         SvgPicture.asset('assets/svgs/whatsappp.svg',height: 1.5.h,),
                                      //         SizedBox(width: 2.w,),
                                      //         Text(
                                      //           'Share',
                                      //           style: TextStyle(
                                      //               fontSize: 9.sp,
                                      //               color: Colors.white
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svgs/fbb.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/wap.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/in.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/xx.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/instaa.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/svgs/tt.svg',
                                        height: 2.7.h,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                    ],
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
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           height: 15.h,
                        //           width: 30.w,
                        //           color: Colors.grey,
                        //           child: Center(
                        //             child: Image(image: AssetImage('assets/images/youtube.png'),height: 4.h,)
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: Padding(
                        //             padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //           child: Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             children: [
                        //               RichText(
                        //                   text: TextSpan(
                        //                     children: [
                        //                       TextSpan(
                        //                         text: 'How to build your online store and get your ',
                        //                         style: TextStyle(
                        //                           fontSize: 10.sp,
                        //                           color: Colors.black
                        //                         )
                        //                       ),
                        //                       TextSpan(
                        //                           text: 'First order!',
                        //                           style: TextStyle(
                        //                               fontSize: 10.sp,
                        //                               color: Colors.black,
                        //                             fontWeight: FontWeight.bold
                        //                           )
                        //                       )
                        //                     ]
                        //                   )
                        //               ),
                        //               SizedBox(height: 2.h,),
                        //               Text(
                        //                 'Learn how you can setup your website & profile with Dailboxx with ZERO coding skills',
                        //                   style: TextStyle(
                        //                       fontSize: 10.sp,
                        //                       color: Colors.black
                        //                   )
                        //               )
                        //             ],
                        //           ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 1.5.h,),
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
                              GestureDetector(
                                onTap: () {
                                  customBottomSheet(
                                      context: context,
                                      widget: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 2.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Apply Filter',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: SvgPicture.asset('assets/svgs/cross.svg',height: 2.5.h,)),
                                            ],
                                          ),
                                          SizedBox(height: 1.h,),
                                          Text(
                                            'Filter by date',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                          SizedBox(height: 3.h,),
                                          GestureDetector(
                                            onTap: () {
                                              ind = 0;
                                              setState(() {

                                              });
                                            },
                                            child: Row(
                                              children: [
                                                ind == 0 ?
                                                customFillContainer()
                                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                                SizedBox(width: 2.w,),
                                                Text(
                                                  'Lifetime',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h,),
                                          GestureDetector(
                                            onTap: () {
                                              ind = 1;
                                              setState(() {

                                              });
                                            },
                                            child: Row(
                                              children: [
                                                ind == 1 ?
                                                customFillContainer()
                                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                                SizedBox(width: 2.w,),
                                                Text(
                                                  'Today',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h,),
                                          GestureDetector(
                                            onTap: () {
                                              ind = 2;
                                              setState(() {

                                              });
                                            },
                                            child: Row(
                                              children: [
                                                ind == 2 ?
                                                customFillContainer()
                                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                                SizedBox(width: 2.w,),
                                                Text(
                                                  'Yesterday',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h,),
                                          GestureDetector(
                                            onTap: () {
                                              ind = 3;
                                              setState(() {

                                              });
                                            },
                                            child: Row(
                                              children: [
                                                ind == 3 ?
                                                customFillContainer()
                                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                                SizedBox(width: 2.w,),
                                                Text(
                                                  'Last week',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h,),
                                          GestureDetector(
                                            onTap: () {
                                              ind = 4;
                                              setState(() {

                                              });
                                            },
                                            child: Row(
                                              children: [
                                                ind == 4 ?
                                                customFillContainer()
                                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                                SizedBox(width: 2.w,),
                                                Text(
                                                  'Last 30 days',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 1.h,),
                                          Divider(thickness: 1,color: Colors.grey,),
                                          SizedBox(height: 1.h,),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7.w, right: 4.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Reset Filter',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: blueColor,
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.7.h),
                                                    child: Text(
                                                      'View Results',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 2.h,)
                                        ],
                                      )
                                  );
                                },
                                child: Row(
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
                                ),
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
                                        'Total Earnings - 2023',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.black,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          click = !click;
                                          setState(() {

                                          });
                                        },
                                        child: Row(
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
                                        ),
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
                        if(click == false)
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
                                    '${provider.dashboardModel!.data!.totalSales}',
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
                        if(click == true)
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              children: [
                                Container(
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 1.3.h,),
                                        Text(
                                          'Total Orders - 2024',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 0.8.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SvgPicture.asset('assets/svgs/l1.svg',height: 2.3.h,),
                                          ],
                                        ),
                                        SizedBox(height: 1.3.h,),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.5.h,),
                                Container(
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 1.3.h,),
                                        Text(
                                          'Total Customers',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 0.8.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '5',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SvgPicture.asset('assets/svgs/l2.svg',height: 2.3.h,),
                                          ],
                                        ),
                                        SizedBox(height: 1.3.h,),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.5.h,),
                                Container(
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                        BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 1.3.h,),
                                        Text(
                                          'Total Products',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 0.8.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '10 / 500',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SvgPicture.asset('assets/svgs/l3.svg',height: 2.3.h,),
                                          ],
                                        ),
                                        SizedBox(height: 1.3.h,),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                              ],
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Image(
                            image: AssetImage('assets/images/vid.png'),
                            height: 20.h,
                            width: 100.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                        //       padding:  EdgeInsets.only(left: 3.w,right: 8.w,top: 1.h,bottom: 1.h),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //          Row(
                        //            children: [
                        //              RichText(
                        //                  text: TextSpan(
                        //                    children: [
                        //                      TextSpan(
                        //                        text: 'Order Statistics - ',
                        //                        style: TextStyle(
                        //                          color: Colors.black,
                        //                          fontSize: 10.sp
                        //                        )
                        //                      ),
                        //                      TextSpan(
                        //                          text: 'January',
                        //                          style: TextStyle(
                        //                              color: blueColor,
                        //                              fontSize: 10.sp
                        //                          )
                        //                      )
                        //                    ]
                        //                  )
                        //              ),
                        //              Icon(Icons.keyboard_arrow_down_outlined,color: blueColor,size: 2.h,),
                        //            ],
                        //          ),
                        //           SizedBox(height: 1.h,),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Column(
                        //                 children: [
                        //                   Text(
                        //                     '0',
                        //                     style: TextStyle(
                        //                       fontSize: 14.sp,
                        //                       color: Colors.black,
                        //                       fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 0.5.h,),
                        //                   Text(
                        //                     'Pending',
                        //                     style: TextStyle(
                        //                         fontSize: 9.sp,
                        //                         color: Color(0xff515151),
                        //                         //fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Text(
                        //                     '6',
                        //                     style: TextStyle(
                        //                         fontSize: 14.sp,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 0.5.h,),
                        //                   Text(
                        //                     'Completed',
                        //                     style: TextStyle(
                        //                       fontSize: 9.sp,
                        //                       color: Color(0xff515151),
                        //                       //fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Column(
                        //                 children: [
                        //                   Text(
                        //                     '0',
                        //                     style: TextStyle(
                        //                         fontSize: 14.sp,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 0.5.h,),
                        //                   Text(
                        //                     'Processing',
                        //                     style: TextStyle(
                        //                       fontSize: 9.sp,
                        //                       color: Color(0xff515151),
                        //                       //fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                 ],
                        //               )
                        //             ],
                        //           ),
                        //           SizedBox(height: 2.h,),
                        //           Row(
                        //             children: [
                        //               Container(
                        //                 decoration: BoxDecoration(
                        //                   color: blueColor,
                        //                   border: Border.all(width: 1,color: Colors.grey)
                        //                 ),
                        //                 child: Padding(
                        //                   padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.7.h),
                        //                   child: SvgPicture.asset('assets/svgs/total_order.svg',height: 2.h,),
                        //                 )
                        //               ),
                        //               SizedBox(width: 3.w,),
                        //               Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Total Orders',
                        //                     style: TextStyle(
                        //                       fontSize: 8.sp,
                        //                       color: Color(0xff515151),
                        //                       //fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 0.2.h,),
                        //                   Text(
                        //                     '7',
                        //                     style: TextStyle(
                        //                         fontSize: 10.sp,
                        //                         color: Colors.black,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 0.5.h,),
                        //
                        //                 ],
                        //               ),
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 2.h,),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 9.h,
                        //     width: 100.w,
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius: BorderRadius.circular(3),
                        //                   boxShadow: [
                        //                     BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                     BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                   ]
                        //               ),
                        //               child: Padding(
                        //                 padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.6.h),
                        //                 child: Column(
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text(
                        //                       'Total Earnings - 2023',
                        //                       style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                       ),
                        //                     ),
                        //                     SizedBox(height: 1.3.h,),
                        //                     Text(
                        //                       'Rs138,867.20',
                        //                       style: TextStyle(
                        //                           color: Colors.black,
                        //                           fontSize: 11.sp,
                        //                         fontWeight: FontWeight.bold
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //         ),
                        //         SizedBox(width: 4.w,),
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.6.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Total Sale - 2023',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.3.h,),
                        //                   Text(
                        //                     '10',
                        //                     style: TextStyle(
                        //                         color: Colors.black,
                        //                         fontSize: 11.sp,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 2.h,),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 9.h,
                        //     width: 100.w,
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.6.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Total Customers',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.3.h,),
                        //                   Text(
                        //                     '5',
                        //                     style: TextStyle(
                        //                         color: Colors.black,
                        //                         fontSize: 11.sp,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 4.w,),
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.6.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'Total Products',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.3.h,),
                        //                   Text(
                        //                     '10',
                        //                     style: TextStyle(
                        //                         color: Colors.black,
                        //                         fontSize: 11.sp,
                        //                         fontWeight: FontWeight.bold
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 2.h,),

                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 7.h,
                        //     width: 100.w,
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'TODAY\'S TOTAL SALE',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     'PKR 0.00',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 2.w,),
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'TODAY\'S ORDER',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     '0',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 1.h,),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 7.h,
                        //     width: 100.w,
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'YESTERDAY',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     'PKR 0.00',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 2.w,),
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     '7 DAYS',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     'PKR 0.00',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 1.h,),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 7.h,
                        //     width: 100.w,
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'THIS MONTH',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     'PKR 13,494.00',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 2.w,),
                        //         Expanded(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(3),
                        //                 boxShadow: [
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                        //                   BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                        //                 ]
                        //             ),
                        //             child: Padding(
                        //               padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        //               child: Column(
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     'LAST MONTH',
                        //                     style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontSize: 10.sp,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 1.h,),
                        //                   Text(
                        //                     'PKR 3,160.00',
                        //                     style: TextStyle(
                        //                         color: Colors.black.withAlpha(200),
                        //                         fontSize: 9.sp
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 2.h,),
                        // Padding(
                        //   padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        //   child: Container(
                        //     height: 20.h,
                        //     width: 100.w,
                        //     child: Image(
                        //       image: AssetImage('assets/images/coming_soon.png'),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 1.h,),
                        // SvgPicture.asset('assets/svgs/stepper.svg',width: 10.w,),
                        // SizedBox(height: 2.h,),
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
                                              text: '${provider.dashboardModel!.data!.products}',
                                              style: TextStyle(
                                                color: redColor,
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/${provider.dashboardModel!.data!.productLimit}',
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
                                              text: '${provider.values}',
                                              style: TextStyle(
                                                color: redColor,
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '/${provider.dashboardModel!.data!.storageSize}',
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
                                    'June 27,2024',
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
                                              '22.82MB',
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
                                              '12/250',
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
