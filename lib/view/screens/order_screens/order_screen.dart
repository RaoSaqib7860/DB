import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import 'create_order_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 8.h,
              width: 100.w,
              color: blueColor,
              child: Center(
                child: Text(
                  'Orders',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 17.h,),
            Image(image: AssetImage('assets/images/empty_order.png'),height: 25.h,),
            SizedBox(height: 3.h,),
            Text(
              'You don\'t have any order yet.',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  //fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 1.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Create an order manually by clicking on the \"',
                    style: TextStyle(
                      color: Color(0xff797979),
                      fontSize: 12.sp,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: 'Create Order',
                    style: TextStyle(
                      color: Color(0xff4C4C4C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: '\" button below',
                    style: TextStyle(
                      color: Color(0xff797979),
                      fontSize: 12.sp,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              )),
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderScreen(),));
                },
                child: Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    color: Color(0xff005493),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Create Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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
