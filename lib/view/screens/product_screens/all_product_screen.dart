import 'package:db_2_0/view/screens/product_screens/publish_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 3.2.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: index == 1 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: index == 1 ? blueColor : Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                      child: Text(
                        'Publish (1)',
                        style: TextStyle(color: index == 1 ? Colors.white : Colors.black,fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: index == 2 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: index == 2 ? blueColor : Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                      child: Text(
                        'Draft (11)',
                        style: TextStyle(color:  index == 2 ? Colors.white : Colors.black,fontSize: 10.sp,),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: index == 3 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: index == 3 ? blueColor : Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                      child: Text(
                        'Incomplete (1)',
                        style: TextStyle(color: index == 3 ? Colors.white : Colors.black,fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 4;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: index == 4 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: index == 4 ? blueColor : Colors.black,width: 1)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                      child: Text(
                        'Trash (1)',
                        style: TextStyle(color: index == 4 ? Colors.white : Colors.black,fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h,),
        if(index==1)
          Expanded(
              child: PublishScreen()
          )
      ],
    );
  }
}
