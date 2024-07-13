import 'package:db_2_0/view/screens/order_screens/create_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import '../../../custom_widgets/custom_bottomsheet.dart';
import '../../../custom_widgets/custom_dialogue.dart';
import '../../../custom_widgets/custom_fill_container.dart';
import 'all_order_screens/all_screen.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  int ind = 0;
  List list = [
    'All',
    'Awaiting processing (0)',
    'Processing (0)',
    'Ready for pickup (0)',
    'Completed (0)',
    'Cancelled (0)',
    'Archived (0)'
  ];

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
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 8.h,
            width: 100.w,
            color: blueColor,
            child: Center(
              child: Text(
                'All Orders',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Container(
                  height: 4.h,
                  width: 77.w,
                  child: TextField(
                    style: TextStyle(fontSize: 12.sp),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      hintText: 'Search Orders',
                      hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
                      contentPadding: EdgeInsets.only(top: 0.5.h,),
                      prefixIcon: Icon(Icons.search,color: Color(0xff6D6D6D),size: 2.3.h,),
                    ),
                  ),
                ),
                SizedBox(width: 4.w,),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          customDialogue(
                            context: context,
                            height: 46.h,
                            content: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Apply Filter',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset('assets/svgs/cross.svg',height: 2.5.h,)),
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Text(
                                    'Filter by date',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Payment Status',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
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
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fulfillment Status',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
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
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Starting date',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'mm/dd/yyyy',
                                                  style: TextStyle(
                                                    color: Color(0xff454545),
                                                    fontSize: 10.sp
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/svgs/calender.svg',height: 2.3.h,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'End date',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      Container(
                                        height: 5.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(3),
                                            boxShadow: [
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(1, 1),spreadRadius: 1,blurRadius: 2),
                                              BoxShadow(color: Colors.grey.withAlpha(50),offset: Offset(-1, -1),spreadRadius: 1,blurRadius: 2),
                                            ]
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'mm/dd/yyyy',
                                                  style: TextStyle(
                                                      color: Color(0xff454545),
                                                      fontSize: 10.sp
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/svgs/calender.svg',height: 2.3.h,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1.h,),
                                  Divider(thickness: 1,color: Colors.grey,),
                                  SizedBox(height: 1.h,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7.w, right: 4.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Reset Filter',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.7.h),
                                            child: Text(
                                              'View Results',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          );
                        },
                        child: SvgPicture.asset('assets/svgs/comp.svg',height: 2.5.h,)
                    )
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 4.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey,width: 1)
              ),
              child: Row(
                children: [
                  Container(
                    height: 3.h,
                    width: 70.w,
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
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customBottomSheet(
                      context: context,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Apply Filter',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset('assets/svgs/cross.svg',height: 2.5.h,)),
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Text(
                            'Filter by date',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 0;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 0 ?
                                customFillContainer()
                                : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'All orders',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 1;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 1 ?
                                customFillContainer()
                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'Awaiting processing (0)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 2;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 2 ?
                                customFillContainer()
                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'Processing (1)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 3;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 3 ?
                                customFillContainer()
                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'Ready for pickup (0)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 4;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 4 ?
                                customFillContainer()
                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'Completed (4)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: () {
                              ind = 5;
                              setState(() {

                              });
                            },
                            child: Row(
                              children: [
                                ind == 5 ?
                                customFillContainer()
                                    : SvgPicture.asset('assets/svgs/empp.svg',height: 2.5.h,),
                                SizedBox(width: 2.w,),
                                Text(
                                  'Cancelled (0)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 1,color: Colors.grey,),
                          SizedBox(height: 1.h,),
                          Padding(
                              padding: EdgeInsets.only(left: 7.w, right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reset Filter',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.7.h),
                                  child: Text(
                                    'View Results',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ),
                          SizedBox(height: 2.h,)
                        ],
                      )
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.7.h),
                      child: Text(
                        'Filter order list',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
            // Container(
            //   height: 3.3.h,
            //   width: 100.w,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: list.length,
            //     itemBuilder: (context, index) {
            //       return Row(
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               ind = index;
            //               setState(() {
            //
            //               });
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 border: Border.all(width:  1.3,color: ind == index ? blueColor : Color(0xff4C4C4C)),
            //                 color: ind == index ? blueColor : Colors.white,
            //                 borderRadius: BorderRadius.circular(15),
            //               ),
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.5.h),
            //                 child: Text(
            //                   list[index],
            //                   style: TextStyle(
            //                       color: ind == index ? Colors.white : Color(0xff4C4C4C),
            //                       fontSize: 9.sp
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           SizedBox(width: 2.w,),
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ),
          SizedBox(height: 2.h,),
          if(ind == 0)
          Expanded(
            child: AllScreen(),
          )
        ],
      ),
    );
  }
}
