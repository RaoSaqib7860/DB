import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import 'create_attribute_screen.dart';
import 'create_attribute_two_screen.dart';

class ProductAttributeScreen extends StatefulWidget {
  const ProductAttributeScreen({Key? key}) : super(key: key);

  @override
  State<ProductAttributeScreen> createState() => _ProductAttributeScreenState();
}

class _ProductAttributeScreenState extends State<ProductAttributeScreen> {
  bool isClick = false;
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
          SizedBox(height: 1.h,),
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
                  if(isClick == true){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAttributeTwoScreen(),));
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAttributeScreen(),));
                  }

                },
                child: Container(
                  height: 3.5.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Create Attribute',
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
                        if(isClick == false)
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Color',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff3E3E3E)
                                      ),
                                    ),
                                    Text(
                                      'Products: 2',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xff3E3E3E)
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 1.h,),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          colorContainer(text: 'Green'),
                                          colorContainer(text: 'Red'),
                                          colorContainer(text: 'Black'),
                                          colorContainer(text: 'Yellow'),
                                          colorContainer(text: 'White'),
                                          colorContainer(text: 'Blue'),
                                          colorContainer(text: 'Pink'),
                                        ],
                                      ),
                                      SizedBox(height: 1.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          colorContainer(text: 'Brown'),
                                          colorContainer(text: 'Grey'),
                                        ],
                                      )
                                    ],
                                  ),

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
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAttributeScreen(),));
                                            },
                                            child: SvgPicture.asset('assets/svgs/action.svg',height: 2.7.h,)),
                                        SizedBox(width: 1.w,),
                                        GestureDetector(
                                            onTap: () {
                                              isClick = true;
                                              setState(() {

                                              });
                                            },
                                            child: SvgPicture.asset('assets/svgs/sett.svg',height: 2.7.h,)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Featured:',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 1.w,),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.4.h),
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9.sp
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Created at',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff0B7A3E),
                                            fontSize: 9.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 0.3.h,),
                                        Text(
                                          '1 month ago',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff636363),
                                            fontSize: 8.5.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        if(isClick == true)
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name: Green',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xff3E3E3E)
                                      ),
                                    ),
                                    Text(
                                      'Products: 2',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color(0xff3E3E3E)
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 7.h,),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAttributeTwoScreen(),));
                                      },
                                      child: SvgPicture.asset('assets/svgs/action.svg',height: 2.7.h,),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Featured:',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 1.w,),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.4.h),
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 9.sp
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Created at',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff0B7A3E),
                                            fontSize: 9.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 0.3.h,),
                                        Text(
                                          '1 month ago',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff636363),
                                            fontSize: 8.5.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
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

  Widget colorContainer({String? text}){
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(3)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
            child: Text(
              text!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w)
      ],
    );
  }

}
