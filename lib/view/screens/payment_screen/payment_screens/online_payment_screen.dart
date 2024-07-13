import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({Key? key}) : super(key: key);

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 3.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Money Transfer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      'Bank Account Number.',
                      style: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.black
                      ),
                    ),
                   // SizedBox(height: 1.h,),
                    // Text(
                    //   'Installed',
                    //   style: TextStyle(
                    //       fontSize: 9.7.sp,
                    //       color: Colors.black
                    //   ),
                    // ),
                    SizedBox(height: 0.8.h,),
                    GestureDetector(
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetailPaymentScreen(),));
                          //AddDetailPaymentScreen();
                          //isSelect = true;
                          setState(() {

                          });
                        },
                        child: Image(image: AssetImage('assets/images/delivered.png'),height: 4.h,)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              'Note: For online payment and bank integration please visit our website and connect your bank.',
              style: TextStyle(
                color: redColor,
                fontSize: 12.sp,
                height: 0.18.h
              ),
            ),
          )
        ],
      ),
    );
  }
}
