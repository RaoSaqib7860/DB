import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import '../../../../custom_widgets/app_colors.dart';
import '../../bottom_sheet/bottom_sheet.dart';

class CashPaymentScreen extends StatefulWidget {
  const CashPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CashPaymentScreen> createState() => _CashPaymentScreenState();
}

class _CashPaymentScreenState extends State<CashPaymentScreen> {
  bool isSelect = false;
  bool _value = false;
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Display name at checkout',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                height: 3.h,
                //width: 90.w,
                child: TextField(
                  //controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: ' Name',
                    hintStyle: TextStyle(
                        fontSize: 10.sp, color: Colors.black.withAlpha(170)),
                    //contentPadding: EdgeInsets.only(top: 0.002.h,left: 2.w)
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'Customers will see this when checking out.',
                style: TextStyle(
                  fontSize: 8.sp,
                  color: Color(0xff8E8E8E),
                  //fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Additional Details',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Container(
                height: 3.h,
                //width: 90.w,
                child: TextField(
                  //controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: ' Type here',
                    hintStyle: TextStyle(
                        fontSize: 10.sp, color: Colors.black.withAlpha(170)),
                    //contentPadding: EdgeInsets.only(top: 0.002.h,left: 2.w)
                  ),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'Displayed on the Payment method page, while the customer\nis choosing how to pay.',
                style: TextStyle(
                  fontSize: 8.sp,
                  color: Color(0xff8E8E8E),
                  //fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                children: [
                  FlutterSwitch(
                    width: 10.w,
                    height: 2.5.h,
                    valueFontSize: 25.0,
                    toggleSize: 2.5.h,
                    value: _value,
                    borderRadius: 30.0,
                    inactiveSwitchBorder:
                        Border.all(color: blueColor, width: 0.7),
                    padding: 1,
                    showOnOff: false,
                    activeColor: blueColor,
                    inactiveColor: Color(0xffD9D9D9),
                    onToggle: (val) {
                      setState(() {
                        _value = val;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Text(
                      'Enable',
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 4.8.h,
                    width: 26.w,
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      ind = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 4.8.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
