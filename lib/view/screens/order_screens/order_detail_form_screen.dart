import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/custom_toast.dart';
import 'all_orders_screen.dart';

class OrderDetailFormScreen extends StatefulWidget {
  const OrderDetailFormScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailFormScreen> createState() => _OrderDetailFormScreenState();
}

class _OrderDetailFormScreenState extends State<OrderDetailFormScreen> {

  bool _value = false;
  var items = [
    'Guest Customer',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Guest Customer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 7.5.h,
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
                    SizedBox(width: 30.w,),
                    Text(
                      'Billing address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.w),
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
                        'Customer Type',
                        style: TextStyle(color: Colors.black,fontSize: 10.sp),
                      ),
                     // SizedBox(height: 1.h,),
                      Container(
                        //height: 4.h,
                        //width: 40.w,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 3.h,),
                          underline: Padding(
                            padding:  EdgeInsets.only(bottom: 0.4.h),
                            child: Container(color: Colors.grey,height: 0.15.h,width: 100.w,),
                          ),
                          value: dropdownvalue,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,style: TextStyle(fontSize: 11.sp,color: Color(0xff8E8E8E)),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                          hint:  Text(
                            "Font Family",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.5.h,),
                      customTextField(name: 'Customer Name',hint: 'Amount'),
                      customTextField(name: 'Customer ID',hint: 'Auto Fill'),
                      customTextField(name: 'Customer Email',hint: 'here@gmail.com'),
                      customTextField(name: 'Customer Phone',hint: '03009680946'),
                      customTextField(name: 'Delivery Type',hint: 'Cash On Delivery'),
                      customTextField(name: 'Address',hint: 'here@email.com'),
                      //SizedBox(height: 1.h,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                              //SizedBox(height: 1.3.h,),
                              Container(
                                //height: 3.7.h,
                                width: 40.w,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: dropdownvalue,
                                  icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 3.h,),
                                  underline: Padding(
                                    padding:  EdgeInsets.only(bottom: 0.4.h),
                                    child: Container(color: Colors.grey,height: 0.15.h,width: 100.w,),
                                  ),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,style: TextStyle(fontSize: 11.sp,color: Color(0xff8E8E8E))),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                  hint:  Text(
                                    "Font Family",
                                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          ),
                          SizedBox(width: 2.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Zip',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                height: 3.h,
                                width: 40.w,
                                child: TextField(
                                  //controller: priceController,
                                  decoration: InputDecoration(
                                      hintText: 'here@email.com',
                                      hintStyle: TextStyle(fontSize: 11.sp),
                                      contentPadding: EdgeInsets.only(bottom: 0.7.h),
                                      isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h,),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.withAlpha(100),
                        thickness: 1.5,
                      ),
                      Text(
                        'Payment Status',
                        style: TextStyle(color: Colors.black,fontSize: 10.sp),
                      ),
                      SizedBox(height: 1.7.h,),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Complete',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Pending',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 1.7.h,),
                      Text(
                        'Payment Method',
                        style: TextStyle(color: Colors.black,fontSize: 10.sp),
                      ),
                      SizedBox(height: 1.7.h,),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'COD',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          ),
                          SizedBox(width: 18.w,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Amount',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 1.7.h,),
                      Text(
                        'Shipping Method',
                        style: TextStyle(color: Colors.black,fontSize: 10.sp),
                      ),
                      SizedBox(height: 1.7.h,),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Your choice',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          ),
                          SizedBox(width: 7.5.w,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svgs/emptyy_checkbox.svg',height: 2.3.h,),
                              SizedBox(width: 2.w,),
                              Text(
                                'Your choice',
                                style: TextStyle(color: Colors.black,fontSize: 10.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 1.7.h,),
                      customTextField(name: 'Payment Id',hint: 'Type here'),
                      customTextField(name: 'Order Note',hint: 'Type here'),
                      //SizedBox(height: 2.h,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                'Cart Items',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
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
                  padding:  EdgeInsets.only(left: 2.w,right: 2.w,top: 1.h,bottom: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Modern Chair Table Chair x 1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            '1,500.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withAlpha(100),
                        thickness: 1.2,
                      ),
                      SizedBox(height: 0.4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            '0.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withAlpha(100),
                        thickness: 1.2,
                      ),
                      SizedBox(height: 0.4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            '1,500.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black.withAlpha(100),
                        thickness: 1.2,
                      ),
                      SizedBox(height: 0.4.h,),
                      Container(
                        height: 3.7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey.withAlpha(100),width: 1)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 53.w,
                              height: 3.7.h,
                              child: TextField(
                                style: TextStyle(fontSize: 12.sp),
                                // controller: widget.controller,
                                // obscureText: widget.obsecureText !=null ? widget.obsecureText! : false,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),borderSide: BorderSide.none),
                                  hintText: 'Promo code',
                                  //labelText: 'Keyword',
                                  //labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
                                  hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
                                  contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                                    color: blueColor
                                ),
                                child: Center(
                                  child: Text(
                                    'Reedem',
                                    style: TextStyle(fontSize: 10.sp,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h,),
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
                            SvgPicture.asset('assets/svgs/pro_toast.svg',height: 3.h,),
                            SizedBox(width: 5.w,),
                            Text(
                              'Order created\nsuccessfully',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AllOrdersScreen(),));
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 5.2.h,
                  //width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff005493),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Create Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h,)
          ],
        ),
      ),
    );
  }

  Widget customTextField({
    String? hint,
    String? name,
    TextEditingController? controller
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: TextStyle(color: Colors.black,fontSize: 10.sp),
        ),
        SizedBox(height: 1.3.h,),
        Container(
          height: 3.h,
          //width: 90.w,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: 11.sp,color: Color(0xff8E8E8E))
              //contentPadding: EdgeInsets.only(top: 0.002.h)
            ),
          ),
        ),
        SizedBox(height: 2.h,),
      ],
    );
  }

}
