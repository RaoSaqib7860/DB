import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import 'delivery_screen/delivery_cost_screen.dart';
import 'delivery_screen/delivery_location_screen.dart';
import 'delivery_screen/delivery_order_screen.dart';

class DeliveryMainScreen extends StatefulWidget {
  const DeliveryMainScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryMainScreen> createState() => _DeliveryMainScreenState();
}

class _DeliveryMainScreenState extends State<DeliveryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          leading: SizedBox(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: TabBar(
              labelStyle: TextStyle(fontSize: 10.sp),
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.only(bottom: 0.5.h),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
              tabs: [
                Text(
                  'Delivery Orders',
                ),
                Text(
                  'Delivery Location',
                ),
                Text(
                  'Delivery Cost',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            DeliveryOrderScreen(),
            DeliveryLocationScreen(),
            DeliveryCostScreen(),
          ],
        ),
      ),
    );
  }
}
