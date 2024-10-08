import 'package:db_2_0/view/screens/store_setup_screen/store_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../custom_widgets/app_colors.dart';
import '../../custom_widgets/custom_line_textfield.dart';
import '../../custom_widgets/custom_toast.dart';

class StoreAddProductScreen extends StatefulWidget {
  const StoreAddProductScreen({Key? key}) : super(key: key);

  @override
  State<StoreAddProductScreen> createState() => _StoreAddProductScreenState();
}

class _StoreAddProductScreenState extends State<StoreAddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.5.h,),
              Container(
                height: 8.h,
                color: blueColor,
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                        SizedBox(width: 25.w,),
                        Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              CustomLineTextField(name: 'Product Name*',hint: 'Lamp',controller: nameController),
              CustomLineTextField(name: 'Price*',hint: 'Rs. Price*',controller: priceController),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Text(
                        'Manage Stoke'
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w),
                      child: FlutterSwitch(
                        activeColor: blueColor,
                        inactiveColor: Color(0xff484848),
                        width: 10.w,
                        height: 2.7.h,
                        valueFontSize: 25.0,
                        toggleSize: 2.3.h,
                        value: _value,
                        borderRadius: 30.0,
                        padding: 1,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            _value = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              CustomLineTextField(name: 'Stock Quantity',hint: 'Quantity',controller: quantityController),
              //SizedBox(height: 40.h,),

              SizedBox(height: 4.h,)
            ],
          ),
          Positioned(
            bottom: 4.h,
            left: 4.w,
            child: GestureDetector(
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
                            SvgPicture.asset('assets/svgs/pro_toast.svg',height: 3.h,),
                            SizedBox(width: 5.w,),
                            Text(
                              'Product created\nsuccessfully',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  height: 0.16.h,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                );
                 Navigator.push(context, MaterialPageRoute(builder: (context) => StoreSetupScreen(),));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(dropdownvalue: 'Product'),));
              },
              child: Container(
                height: 5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
