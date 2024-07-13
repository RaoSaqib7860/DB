import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PayoutDetailScreen extends StatefulWidget {
  const PayoutDetailScreen({Key? key}) : super(key: key);

  @override
  State<PayoutDetailScreen> createState() => _PayoutDetailScreenState();
}

class _PayoutDetailScreenState extends State<PayoutDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          SizedBox(height: 3.h,),
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
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.5.h,),
                  customLisTile(title: 'Bank',subTitle: 'Allied Bank'),
                  customLisTile(title: 'Account Title',subTitle: 'Ahmed khan'),
                  customLisTile(title: 'Account Number',subTitle: '************3422'),
                  customLisTile(title: 'City',subTitle: 'Rawalpindi'),
                  customLisTile(title: 'Address',subTitle: 'phase 7 Rawalpindi'),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

                ),
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      child: Container(
                        //height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h,),
                              Text(
                                'Bank Account Info',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              bottomTextField(hint: 'Select Bank*'),
                              bottomTextField(hint: 'Account title*'),
                              bottomTextField(hint: 'Account Number/IBAN*'),
                              SizedBox(height: 1.h,),
                              Text(
                                'Address Info',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              bottomTextField(hint: 'City'),
                              bottomTextField(hint: 'Address'),
                              SizedBox(height: 4.h,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Container(
                                    height: 5.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xff005493),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Add Payout Method',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Container(
                height: 5.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Color(0xff005493),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Center(
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomTextField({String? hint}){
    return Column(
      children: [
        Container(
          height: 3.h,
          child: TextField(
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 9.sp
                )
            ),
          ),
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }

  Widget customLisTile({String? title, String? subTitle}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 0.5.h,),
        Text(
          subTitle!,
          style: TextStyle(
            color: Color(0xff4C4C4C),
            fontSize: 9.sp,
          ),
        ),
        SizedBox(height: 2.h,),
      ],
    );
  }

}
