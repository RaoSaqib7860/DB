import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7C0010),
      height: 100.h,
      width: 60.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 7.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              height: 6.h,
              width: 12.w,
              color: Colors.white,
              child: Center(
                child: SvgPicture.asset('assets/svgs/image.svg',height: 3.h,),
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              'Business name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: EdgeInsets.only(left: 8.w,right: 21.w),
            child: Divider(
              color: Color(0xffADADAD),
              thickness: 0.5,
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            height: 70.h,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 17.w),
                  child: Container(
                    height: 4.h,
                    //width: 30.w,
                    decoration: BoxDecoration(
                      //color: Color(0xff005493),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svgs/ana.svg',height: 2.2.h,),
                          SizedBox(width: 2.w,),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp
                            ),
                          ),
                          //SizedBox(width: 1.w,),
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 3.h,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.6.h,),
                customRow(image: 'dis',text: 'Discount Coupons'),
                customRow(image: 'cus',text: 'Customers'),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Container(
                    height: 4.h,
                    //width: 30.w,
                    decoration: BoxDecoration(
                      //color: Color(0xff005493),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svgs/ban.svg',height: 2.2.h,),
                          SizedBox(width: 2.w,),
                          Text(
                            'Banner And Sliders',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp
                            ),
                          ),
                          //SizedBox(width: 1.w,),
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 3.h,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customRow({String? image, String? text,}){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              SvgPicture.asset('assets/svgs/$image.svg',height: 2.2.h,),
              SizedBox(width: 2.w,),
              Text(
                text!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.6.h,)
      ],
    );
  }

}
