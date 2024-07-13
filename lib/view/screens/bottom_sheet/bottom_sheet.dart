import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/custom_fill_container.dart';
import '../account_screen/account_scrreen.dart';
import '../delivery_screens/delivery_main_screen.dart';
import '../drawer_screen/drawer_screen.dart';
import '../home_screen/home_screen.dart';
import '../order_screens/all_orders_screen.dart';
import '../order_screens/order_screen.dart';
import '../product_screens/product_screen.dart';


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

  @override
  void initState() {
    persistentcontroller = PersistentTabController(initialIndex: widget.index!);
    super.initState();
  }
  bool? reel_active = false;
  bool isSelected = false;

  var items = [
    'Eng',
    'Urdu',
  ];
  String dropdownvalue = 'Eng';

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
            // leading: Padding(
            //   padding:  EdgeInsets.only(left: 6.w),
            //   child: GestureDetector(
            //       onTap: () {
            //         _scaffoldKey.currentState?.openDrawer();
            //       },
            //       child: SvgPicture.asset('assets/svgs/menu.svg',)),
            // ),
            //leadingWidth: 12.w,
            title: Image(image: AssetImage('assets/images/app_logo.png'),height: 4.h,),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: GestureDetector(
                    onTap: () {
                      isSelected = true;
                      setState(() {

                      });
                    },
                    child: SvgPicture.asset('assets/svgs/noti.svg',height: 3.h,)),
              ),
            ],
            leading:
            // DropdownButton(
            //   //isExpanded: true,
            //   value: dropdownvalue,
            //   icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 2.h,),
            //   underline: Container(),
            //   items: items.map((String items) {
            //     return DropdownMenuItem(
            //       value: items,
            //       child: Text(items,style: TextStyle(color: Colors.black54),),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownvalue = newValue!;
            //     });
            //   },
            //   hint:  Text(
            //     "Font Family",
            //     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            //   ),
            // )
            Padding(
              padding: EdgeInsets.only(left: 0.w),
              child: Row(
                children: [
                  Text(
                    'Eng',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp
                    ),
                  ),
                  //SizedBox(width: 2.w,),
                  Icon(Icons.arrow_drop_down,color: Colors.black,size: 3.h,)
                ],
              ),
            ),
          ),
          //drawer: DrawerScreen(),

          body: PersistentTabView.custom(
            context,
            itemCount: 5,
            backgroundColor: blueColor,
            controller: persistentcontroller,
            selectedTabScreenContext: (context) {},
            screens: _buildScreens(),
            confineInSafeArea: true,
            //bottomScreenMargin: 0,
            //backgroundColor: Colors.transparent,
            onWillPop: (v) async {
              return true;
            },
            handleAndroidBackButtonPress: true,
            //resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
            ),
            customWidget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CustomNavBarWidget(
                items: _navBarsItems(),
                selectedIndex: persistentcontroller!.index,
                onItemSelected: (v) {
                  persistentcontroller!.index = v;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
        if(isSelected == true)
          Scaffold(
            backgroundColor: Colors.black.withAlpha(100),
            body: Container(
              height: 100.h,
              width: 100.w,
              color: Colors.black.withAlpha(100),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              isSelected = false;
                              setState(() {

                              });
                            },
                            child: SvgPicture.asset('assets/svgs/closeee.svg',height: 3.5.h,)),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 1.h,),
                                        Row(
                                          children: [
                                            Image(image: AssetImage('assets/images/book.png'),height: 7.h,),
                                            SizedBox(width: 2.w,),
                                            Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          'You have new order',
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 9.sp,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        Text(
                                                          'Today',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 9.sp,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 0.5.h,),
                                                    Text(
                                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 7.sp,
                                                      ),
                                                    )
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                              ],
                            );
                          },))
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      AllOrdersScreen(),
      //OrderScreen(),
      ProductScreen(dropdownvalue: 'All Products'),
      DeliveryMainScreen(),
      AccountScreen(),
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
          icon: SizedBox(
            child: SvgPicture.asset(
              'assets/svgs/Order.svg',
            ),
            height: 5.h,

          ),
          inactiveIcon: SizedBox(
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
            child: SvgPicture.asset('assets/svgs/Product.svg',color: Colors.white,),
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
            child: SvgPicture.asset('assets/svgs/Delivery.svg',color: Colors.white,),
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
