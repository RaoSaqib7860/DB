import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';
import '../../../api_repository/api_utils.dart';
import '../account_screen/account_scrreen.dart';
import '../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../delivery_screens/delivery_main_screen.dart';
import '../home_screen/home_screen.dart';
import '../order_screens/Models/all_order_model.dart';
import '../order_screens/all_orders_screen.dart';
import '../product_screens/product_screen.dart';
import 'package:badges/badges.dart' as badges;

PersistentTabController? persistentcontroller;
bool selectHome = true;

class BottomSheetScreen extends StatefulWidget {
  final int? index;
  BottomSheetScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    get_orders();
    persistentcontroller = PersistentTabController(initialIndex: widget.index!);
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  bool? reel_active = false;
  bool isSelected = false;

  var items = [
    'Eng',
    'Urdu'.tr,
  ];
  String dropdownvalue = 'Eng';
  AllOrderModel? allOrderModel;
  get_orders() async {
    print('get_orders call');
    allOrderModel = await DataProvider().allOrderModelApi(map: {
      'user_id': '${user_model.data!.userId}',
      'type': 'all',
    });
    setState(() {});
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  bool active_dialog = false;
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    print('Connectivity changed: $_connectionStatus');
    if (_connectionStatus.contains(ConnectivityResult.none) &&
        active_dialog == false) {
      active_dialog = true;
      showDialog(
          context: context,
          builder: (BuildContext context) => const CupertinoAlertDialog(
                title: Text("No Internet Connection"),
                content: Text(
                    "You are not connected to the internet.Kindly check your connection and try again."),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text("OK"),
                  ),
                ],
              ));
    } else {
      if (active_dialog) {
        active_dialog = false;
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Hero(
              tag: 'app_logo',
              child: Image(
                image: AssetImage('assets/images/app_logo.png'),
                height: 4.h,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: GestureDetector(
                    onTap: () {
                      isSelected = true;
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/noti.svg',
                      height: 3.h,
                    )),
              ),
            ],
            leadingWidth: 20.w,
            // leading: Padding(
            //   padding: EdgeInsets.only(left: 4.w),
            //   child: DropdownButton(
            //     isExpanded: true,
            //     value: dropdownvalue,
            //     icon: Icon(
            //       Icons.keyboard_arrow_down,
            //       color: Colors.black,
            //       size: 2.h,
            //     ),
            //     underline: Container(),
            //     items: items.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(
            //           items,
            //           style: TextStyle(color: Colors.black54),
            //         ),
            //       );
            //     }).toList(),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownvalue = newValue!;
            //       });
            //     },
            //   ),
            // )
          ),
          body: PersistentTabView.custom(
            context,
            itemCount: 5,
            backgroundColor: blueColor,
            controller: persistentcontroller,
            selectedTabScreenContext: (context) {},
            screens: _buildScreens(),
            onWillPop: (v) async {
              return true;
            },
            handleAndroidBackButtonPress: true,
            stateManagement: true,
            customWidget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomNavBarWidget(
                items: _navBarsItems(),
                selectedIndex: persistentcontroller!.index,
                onItemSelected: (v) {
                  persistentcontroller!.index = v;
                  setState(() {});
                  if (v == 1) {
                    get_orders();
                  }
                },
              ),
            ),
          ),
        ),
        if (isSelected == true)
          Scaffold(
            backgroundColor: Colors.black.withAlpha(100),
            body: Container(
              height: 100.h,
              width: 100.w,
              color: Colors.black.withAlpha(100),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              isSelected = false;
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              'assets/svgs/closeee.svg',
                              height: 3.5.h,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Expanded(
                        child: (allOrderModel?.data?.orderCounts?.pending ==
                                    null ||
                                allOrderModel!.data!.orderCounts!.pending! == 0)
                            ? Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'You have no order'.tr,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Today'.tr,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 9.sp,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                ],
                                              ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                itemCount:
                                    allOrderModel?.data?.orderCounts?.pending ??
                                        0,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        'assets/images/book.png'),
                                                    height: 7.h,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'You have new order'
                                                                .tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 9.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            'Today'.tr,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 9.sp,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      // Text(
                                                      //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                                                      //       .tr,
                                                      //   style: TextStyle(
                                                      //     color: Colors.black,
                                                      //     fontSize: 7.sp,
                                                      //   ),
                                                      // )
                                                    ],
                                                  ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  );
                                },
                              ))
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }

  List<CustomNavBarScreen> _buildScreens() {
    return [
      CustomNavBarScreen(
        screen: HomeScreen(),
      ),
      CustomNavBarScreen(
        screen: AllOrdersScreen(),
      ),
      CustomNavBarScreen(
        screen: ProductScreen(),
      ),
      CustomNavBarScreen(
        screen: DeliveryMainScreen(),
      ),
      CustomNavBarScreen(
        screen: AccountScreen(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SizedBox(
          height: 5.h,
          child: SvgPicture.asset(
            'assets/svgs/homee.svg',
          ),
        ),
        inactiveIcon: SizedBox(
          height: 5.h,
          child: SvgPicture.asset(
            'assets/svgs/homee.svg',
            color: Colors.white,
          ),
        ),
        activeColorPrimary: Colors.white,
        //inactiveColorPrimary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: allOrderModel != null &&
                allOrderModel!.data!.orderCounts!.pending != 0
            ? badges.Badge(
                position: badges.BadgePosition.topEnd(top: -1, end: -2),
                showBadge: true,
                ignorePointer: false,
                onTap: () {},
                badgeStyle: badges.BadgeStyle(
                  badgeColor: redColor,
                ),
                badgeContent: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                      style: TextStyle(fontSize: 9, color: Colors.white),
                      '${allOrderModel?.data?.orderCounts?.pending}'),
                ),
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/svgs/Order.svg',
                  ),
                  height: 5.h,
                ),
              )
            : SizedBox(
                child: SvgPicture.asset(
                  'assets/svgs/Order.svg',
                ),
                height: 5.h,
              ),
        inactiveIcon: allOrderModel != null &&
                allOrderModel!.data!.orderCounts!.pending != 0
            ? badges.Badge(
                position: badges.BadgePosition.topEnd(top: -1, end: -2),
                showBadge: true,
                ignorePointer: false,
                onTap: () {},
                badgeStyle: badges.BadgeStyle(
                  badgeColor: redColor,
                ),
                badgeContent: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                      style: TextStyle(fontSize: 9, color: Colors.white),
                      '${allOrderModel?.data?.orderCounts?.pending}'),
                ),
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/svgs/Order.svg',
                    color: Colors.white,
                  ),
                  height: 5.h,
                ),
              )
            : SizedBox(
                child: SvgPicture.asset(
                  'assets/svgs/Order.svg',
                  color: Colors.white,
                ),
                height: 5.h,
              ),
        activeColorPrimary: Colors.white,
        // inactiveColorPrimary: Colors.grey
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          child: SvgPicture.asset('assets/svgs/Product.svg'),
          height: 5.h,
        ),
        inactiveIcon: SizedBox(
          child: SvgPicture.asset(
            'assets/svgs/Product.svg',
            color: Colors.white,
          ),
          height: 5.h,
        ),
        activeColorPrimary: Colors.white,
        // inactiveColorPrimary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: SizedBox(
          child: SvgPicture.asset('assets/svgs/Delivery.svg'),
          height: 5.h,
        ),
        inactiveIcon: SizedBox(
          child: SvgPicture.asset(
            'assets/svgs/Delivery.svg',
            color: Colors.white,
          ),
          height: 5.h,
        ),
        activeColorPrimary: Colors.white,
        //inactiveColorPrimary: Colors.white
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/Account.svg',
          height: 5.h,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svgs/Account.svg',
          height: 5.h,
          color: Colors.white,
          //color: Colors.grey,
        ),
        //activeColorPrimary: Colors.white,
        //inactiveColorPrimary: Colors.white
      ),
    ];
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final List<PersistentBottomNavBarItem>? items;
  final ValueChanged<int>? onItemSelected;

  CustomNavBarWidget({
    Key? key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: !isSelected ? item.icon : item.inactiveIcon!,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              this.onItemSelected!(0);
            },
            child: _buildItem(items![0], selectedIndex == 0),
          ),
          GestureDetector(
            onTap: () {
              this.onItemSelected!(1);
            },
            child: _buildItem(items![1], selectedIndex == 1),
          ),
          GestureDetector(
            onTap: () {
              this.onItemSelected!(2);
            },
            child: _buildItem(items![2], selectedIndex == 2),
          ),
          GestureDetector(
            onTap: () {
              this.onItemSelected!(3);
            },
            child: _buildItem(items![3], selectedIndex == 3),
          ),
          GestureDetector(
            onTap: () {
              this.onItemSelected!(4);
            },
            child: _buildItem(items![4], selectedIndex == 4),
          )
        ],
      ),
    );
  }
}
