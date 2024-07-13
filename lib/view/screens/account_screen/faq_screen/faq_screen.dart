import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  bool isSelected = false;

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
                    SizedBox(width: 2.w,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                    SizedBox(width: 40.w,),
                    Text(
                      'FAQ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Need Help?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  customCard(text: 'Product', icon: Icons.keyboard_arrow_down),
                  customCard(text: 'Orders', icon: Icons.keyboard_arrow_down),
                  GestureDetector(
                      onTap: () {
                        isSelected = !isSelected;
                        setState(() {

                        });
                      },
                      child: customCard(text: 'Delivery', icon: isSelected == true ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)),
                  if(isSelected == true)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'How does Dailboxx Delivery works?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Icon(Icons.add,color: Colors.black,size: 2.5.h,),
                          ],
                        ),
                        Divider(thickness: 1,color: Color(0xff928B8B),),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'How do I start shipping with Dailboxx Delivery?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Icon(Icons.add,color: Colors.black,size: 2.5.h,),
                          ],
                        ),
                        Divider(thickness: 1,color: Color(0xff928B8B),),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'How should I use Dailboxx Delivery?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Icon(Icons.remove,color: Colors.black,size: 2.5.h,),
                          ],
                        ),
                        SizedBox(height: 0.5.h,),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Text(
                            'Dailboxx has partnered with leading courier companies to get you the most & cost-effective shipping efficiently ',
                            style: TextStyle(
                              color: Color(0xff656565),
                              fontSize: 9.sp,
                            ),
                          ),
                        ),
                        Divider(thickness: 1,color: Color(0xff928B8B),),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'When will I get paid?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Icon(Icons.remove,color: Colors.black,size: 2.5.h,),
                          ],
                        ),
                        SizedBox(height: 0.5.h,),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Text(
                            'Dailboxx will process the payout within 1-3 business days after the order is delivered  ',
                            style: TextStyle(
                              color: Color(0xff656565),
                              fontSize: 9.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h,),
                      ],
                    ),

                  customCard(text: 'Store Setup', icon: Icons.keyboard_arrow_down),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    );
  }

  Widget customCard({String? text, IconData? icon}){
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 5.3.h,
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
              padding: EdgeInsets.only(left: 3.w,right: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(icon,size: 2.5.h,color: Color(0xff4C4C4C),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1.5.h,)
      ],
    );
  }

}
