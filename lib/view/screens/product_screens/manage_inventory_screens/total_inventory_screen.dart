import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../edit_product/edit_product.dart';
import '../edit_product/edit_product_screen/inventory_screen.dart';
import '../product_categories_screen/create_category_screen.dart';
import '../product_categories_screen/product_categories_screen.dart';

class TotalInventoryScreen extends StatefulWidget {
  const TotalInventoryScreen({Key? key}) : super(key: key);

  @override
  State<TotalInventoryScreen> createState() => _TotalInventoryScreenState();
}

class _TotalInventoryScreenState extends State<TotalInventoryScreen> {
  TextEditingController productController = TextEditingController();
  bool _value = false;
  var items = [
    'Select Action',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Select Action';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                                child: Text(items,style: TextStyle(fontSize: 9.sp,color: Colors.black),),
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
                              style: TextStyle(fontSize: 9.sp,color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCategoryScreen(),));
                },
                child: Container(
                  height: 4.h,
                  width: 13.w,
                  decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 1.5.h,),
          Container(
            height: 4.5.h,
            width: 100.w,
            child: TextField(
              style: TextStyle(fontSize: 12.sp),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                hintText: 'Search Products',
                hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 0.5.h,),
                prefixIcon: Icon(Icons.search,color: Color(0xff6D6D6D),size: 2.3.h,),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Expanded(
              child: ListView.builder(
                itemCount: 2,
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
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 9.h,
                                      width: 18.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.grey),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(
                                        child: Icon(Icons.image,color: blueColor,size: 5.h,),
                                      ),
                                    ),
                                    SizedBox(width: 2.w,),
                                    Expanded(
                                        child:  Padding(
                                          padding:  EdgeInsets.only(top: 0.5.h),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Modren Table',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color(0xff3E3E3E)
                                                ),
                                              ),
                                              SizedBox(height: 1.1.h,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                                text: 'SKU: ',
                                                                style: TextStyle(
                                                                    color: Color(0xff3E3E3E),
                                                                    fontSize: 9.sp
                                                                )
                                                            ),
                                                            TextSpan(
                                                                text: '100Rs ',
                                                                style: TextStyle(
                                                                    color: Color(0xff3E3E3E).withAlpha(200),
                                                                    fontSize: 9.sp
                                                                )
                                                            ),
                                                            TextSpan(
                                                                text: '200Rs',
                                                                style: TextStyle(
                                                                    color: Color(0xff3E3E3E).withAlpha(200),
                                                                    fontSize: 9.sp,
                                                                    decoration: TextDecoration.lineThrough
                                                                )
                                                            )
                                                          ]
                                                      )
                                                  ),
                                                  Text(
                                                    'In Stock',
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: Color(0xff0B7A3E)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 0.8.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                                text: 'STOCK MANAGE: ',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 8.sp
                                                                )
                                                            ),
                                                            TextSpan(
                                                                text: 'Yes',
                                                                style: TextStyle(
                                                                    color: redColor,
                                                                    fontSize: 8.sp
                                                                )
                                                            ),

                                                          ]
                                                      )
                                                  ),
                                                  FlutterSwitch(
                                                    activeColor: Color(0xff0B7A3E),
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
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.5.h,),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                ),
                                SizedBox(height: 0.5.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(dropdownvalue: 'Inventory'),));
                                       // Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryScreen(),));
                                        //dropdownvalue = 'Inventory';
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/svgs/scale.svg',height: 2.5.h,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            'Quantity',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.sp
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.remove,color: Color(0xff050505),size: 1.5.h,),
                                        SizedBox(width: 2.w,),
                                        Text(
                                          '20',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(width: 1.w,),
                                        Icon(Icons.add,color: Color(0xff050505),size: 1.5.h,),
                                      ],
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
                },))
        ],
      ),
    );
  }
}
