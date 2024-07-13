import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/view/screens/payment_screen/payment_screens/transaction_all_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int ind = 0;
  List list = [
    'All Order (3)',
    'Today (1)',
    'Yesterday (2) '
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          SizedBox(height: 2.h,),
          Container(
            height: 4.h,
            child: TextField(
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Search Search History',
                hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 0.5.h,),
                prefixIcon: Icon(Icons.search,color: Color(0xff6D6D6D),size: 2.3.h,),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            height: 3.3.h,
            width: 100.w,
            child: Padding(
              padding:  EdgeInsets.only(top: 1),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ind = index;
                          setState(() {

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1,color: ind == index ? blueColor : Colors.black),
                            color: ind == index ? blueColor : Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.6.h),
                            child: Text(
                              list[index],
                              style: TextStyle(
                                  color: ind == index ? Colors.white : Colors.black,
                                  fontSize: 9.5.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w,)
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          if(ind == 0)
            Expanded(child: TransactionAllOrderScreen()),
        ],
      ),
    );
  }
}
