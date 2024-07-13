import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_form_field.dart';
import '../../order_screens/all_order_screens/all_order_detail_screen.dart';
import 'delivery_order_screens/tcs_screen.dart';

class DeliveryOrderScreen extends StatefulWidget {
  const DeliveryOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryOrderScreen> createState() => _DeliveryOrderScreenState();
}

class _DeliveryOrderScreenState extends State<DeliveryOrderScreen> {
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return
      ind == 0 ?
    Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 3.5.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey,width: 1)
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 3.h,
                          width: 33.w,
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 2.w,right: 1.w),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: Container(),
                                icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.h,color: Colors.black,),
                                value: dropdownvalue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,style: TextStyle(fontSize: 8.sp,color: Colors.black),),
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
                          ),
                        ),
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight:  Radius.circular(6)),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 7.sp,color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => TcsScreen(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 0.7.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pick up address for',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 7.sp,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 1.w,),
                            SvgPicture.asset('assets/svgs/tcs.svg',height: 1.3.h,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ListView.builder(
                    itemCount: 3,
                    padding: EdgeInsets.only(bottom: 12.h),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(1.0),
                        child: Column(
                          children: [
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
                                padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 0.5.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ID : 29",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp
                                          ),
                                        ),
                                        Text(
                                          "779408322017",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: 0.5.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(top: 0.5.h),
                                          child: Text(
                                            "Furqan Mustafa",
                                            style: TextStyle(
                                                color: Color(0xff005493),
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'COD',
                                          style: TextStyle(
                                              color: redColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )

                                      ],
                                    ),
                                    SizedBox(height: 0.2.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "03001234567",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Container(
                                          color: Color(0xffF0C9D0),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                            child: Text(
                                              '2024-02-23',
                                              style: TextStyle(
                                                  color: redColor,
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 0.2.h,),
                                    Text(
                                      'Karachi',
                                      style: TextStyle(
                                          color: Color(0xff9B001E),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    //SizedBox(height: 1.h,),
                                    Divider(
                                      thickness: 0.8,
                                      color: Color(0xff707070),
                                    ),
                                    SizedBox(height: 0.1.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'To : Islamabad',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllOrderDetailScreen(),));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.black,width: 0.7)
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 2.w ,right: 1.w ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Detail',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9.sp,
                                                      //fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  SizedBox(width: 2.w,),
                                                  Icon(Icons.keyboard_arrow_right_sharp,size: 2.h,color: Colors.black,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h,)

                          ],
                        ),
                      );
                    },),
                ))
          ],
        ),
        Positioned(
          bottom: 2.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                ind = 1;
                setState(() {
                });
              },
              child: Container(
                height: 5.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Create Delivery (COD)',
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
        )
      ],
    )
          :
    ind == 1 ?
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 2.h,),
          CustomFormField(name: 'Cost Center Code',hint: 'DB-807029'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:8.w),
            child: Text(
              'Order #',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withAlpha(170),
                  fontSize: 10.sp
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:8.w),
            child: Container(
              height: 4.2.h,
              child: DropdownButton(
                isExpanded: true,
                underline: Padding(
                  padding:  EdgeInsets.only(bottom: 0.2.h),
                  child: Container(color: Colors.grey,height: 0.1.h,width: 100.w,),
                ),
                icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.5.h,color: Colors.grey,),
                value: dropdownvalue,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items,style: TextStyle(fontSize: 9.sp,color: Colors.black.withAlpha(170)),),
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
          ),
          SizedBox(height: 2.h,),
          CustomFormField(name: 'Customer Name',hint: 'Customer full name'),
          CustomFormField(name: 'Customer Address',hint: 'Customer complete address`'),
          CustomFormField(name: 'Customer Cell #',hint: 'Customer mobile number'),
          CustomFormField(name: 'Customer Email',hint: 'Customer register email address'),
          CustomFormField(name: 'Sending City',hint: 'Karachi'),
          CustomFormField(name: 'Receiving City',hint: 'Receiving to city'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(top: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Weight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withAlpha(170),
                                fontSize: 10.sp
                            ),
                          ),
                          Container(
                            height: 4.2.h,
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Padding(
                                padding:  EdgeInsets.only(bottom: 0.2.h),
                                child: Container(color: Colors.grey,height: 0.1.h,width: 100.w,),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,size: 2.5.h,color: Colors.grey,),
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items,style: TextStyle(fontSize: 9.sp,color: Colors.black.withAlpha(170)),),
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
                        ],
                      ),
                    )
                ),
                SizedBox(width: 4.w,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No of Items',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withAlpha(170),
                          fontSize: 10.sp
                      ),
                    ),
                    //SizedBox(height: 0.2.h,),
                    Container(
                      height: 3.h,
                      //width: 90.w,
                      child: TextField(
                        //controller: widget.controller,
                        style: TextStyle(fontSize: 10.sp,color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'No of Items number',
                            hintStyle: TextStyle(fontSize: 10.sp),
                            contentPadding: EdgeInsets.only(bottom: 1.6.h)
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'COD Amount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withAlpha(170),
                              fontSize: 10.sp
                          ),
                        ),
                        //SizedBox(height: 0.2.h,),
                        Container(
                          height: 3.h,
                          //width: 90.w,
                          child: TextField(
                            //controller: widget.controller,
                            style: TextStyle(fontSize: 10.sp,color: Colors.black),
                            decoration: InputDecoration(
                                hintText: 'COD Amount',
                                hintStyle: TextStyle(fontSize: 10.sp),
                                contentPadding: EdgeInsets.only(bottom: 1.6.h)
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(width: 4.w,),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Reference No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withAlpha(170),
                          fontSize: 10.sp
                      ),
                    ),
                    //SizedBox(height: 0.2.h,),
                    Container(
                      height: 3.h,
                      //width: 90.w,
                      child: TextField(
                        //controller: widget.controller,
                        style: TextStyle(fontSize: 10.sp,color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Customer Reference No',
                            hintStyle: TextStyle(fontSize: 10.sp),
                            contentPadding: EdgeInsets.only(bottom: 1.6.h)
                        ),
                      ),
                    ),
                  ],
                )
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          CustomFormField(name: 'Remarks',hint: 'Any comment'),
          SizedBox(height: 2.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () {
                ind = 0;
                setState(() {
                });
              },
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Save',
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
          SizedBox(height: 3.h,),
        ],
      ),
    ) :
      Stack(
      children: [
        Positioned(
          bottom: 18.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                ind = 1;
                setState(() {

                });
                //Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(),));
              },
              child: Container(
                height: 5.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: Color(0xff747474),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Create Delivery (COD)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => TcsScreen(),));
              },
              child: Container(
                height: 5.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pick up address for',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            //fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      SvgPicture.asset('assets/svgs/tcs.svg',height: 3.h,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
