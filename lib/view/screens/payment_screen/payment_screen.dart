import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/view/screens/payment_screen/payment_screens/payment_main_screen.dart';
import 'package:db_2_0/view/screens/payment_screen/payment_screens/payout_detail_screen.dart';
import 'package:db_2_0/view/screens/payment_screen/payment_screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
              indicatorColor: blueColor,
              dividerColor: blueColor,
              labelPadding: EdgeInsets.only(bottom: 0.5.h),
              tabs: [
                Text(
                  'Payment Method'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            PaymentMainScreen(),
          ],
        ),
      ),
    );
  }
}
