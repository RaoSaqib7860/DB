import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../custom_widgets/custom_toast.dart';

class EditShippingAddressScreen extends StatefulWidget {
  const EditShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditShippingAddressScreen> createState() => _EditShippingAddressScreenState();
}

class _EditShippingAddressScreenState extends State<EditShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7.h,
              width: 100.w,
              color: blueColor,
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 3.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 2.w,),
                    Text(
                      'Edit Shippng Address for Order No: #ocatine362',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                children: [
                  CustomLineTextField(name: 'Customer Name', hint: 'Hamza',),
                  CustomLineTextField(name: 'Customer Email', hint: 'hamza@hotmail.com',),
                  CustomLineTextField(name: 'Customer Phone',),
                  CustomLineTextField(name: 'Zip Code',),
                  CustomLineTextField(name: 'Address',),
                  CustomLineTextField(name: 'Shipping Method',),
                  SizedBox(height: 10.h,),
                  GestureDetector(
                    onTap: () {
                      CustomToastManager.showToast(
                          context: context,
                          height: 8.h,
                          width: 60.w,
                          message: Center(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w),
                              child: Row(
                                children: [
                                  SizedBox(width: 5.w,),
                                  SvgPicture.asset('assets/svgs/pro_toast.svg',height: 4.h,),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    'Order Updated',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      );
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Container(
                        height: 5.5.h,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13.sp
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
