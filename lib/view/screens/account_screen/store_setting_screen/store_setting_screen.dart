import 'package:db_2_0/view/screens/account_screen/store_setting_screen/social_links_screen.dart';
import 'package:db_2_0/view/screens/account_screen/store_setting_screen/store_information.dart';
import 'package:db_2_0/view/screens/account_screen/store_setting_screen/store_location.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';

class StoreSettingScreen extends StatefulWidget {
  const StoreSettingScreen({Key? key}) : super(key: key);

  @override
  State<StoreSettingScreen> createState() => _StoreSettingScreenState();
}

class _StoreSettingScreenState extends State<StoreSettingScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 7.h,
            width: 100.w,
            color: blueColor,
            child: Center(
              child: Text(
                'Store Setting',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            height: 3.2.h,
            child: Padding(
              padding:  EdgeInsets.only(top: 1),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index == 1 ? blueColor:Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: index == 1 ? blueColor:Colors.grey,width: 1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.5.h),
                        child: Text(
                          'Store Information',
                          style: TextStyle(color: index == 1 ? Colors.white:Colors.grey,fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index == 2 ? blueColor:Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: index == 2 ? blueColor:Colors.grey,width: 1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                        child: Text(
                          'Store Location',
                          style: TextStyle(color: index == 2 ? Colors.white:Colors.grey,fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index == 3 ? blueColor:Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: index == 3 ? blueColor:Colors.grey,width: 1)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                        child: Text(
                          'Social Links',
                          style: TextStyle(color: index == 3 ? Colors.white:Colors.grey,fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          if(index == 1)
            Expanded(child: StoreInnfoScreen()),
          if(index == 2)
            Expanded(child: StoreLocationScreen()),
          if(index == 3)
            Expanded(child: SocialLinksScreen()),
        ],
      ),
    );
  }
}
