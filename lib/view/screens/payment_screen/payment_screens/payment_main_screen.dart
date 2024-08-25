import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'cash_payment_screen.dart';
import 'cod_online_view.dart';
import 'online_payment_screen.dart';

class PaymentMainScreen extends StatefulWidget {
  const PaymentMainScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMainScreen> createState() => _PaymentMainScreenState();
}

class _PaymentMainScreenState extends State<PaymentMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 5.h,
          leading: SizedBox(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: TabBar(
                labelStyle: TextStyle(fontSize: 10.sp),
                indicatorColor: Colors.black,
                labelPadding: EdgeInsets.only(bottom: 1.h),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
                dividerColor: Colors.white,
                indicatorWeight: 0.6,
                tabs: [
                  Text(
                    'Cash payment'.tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Online payment'.tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            CODAndOnline(
              type: 'cod'.tr,
            ),
            CODAndOnline(
              type: 'online'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
