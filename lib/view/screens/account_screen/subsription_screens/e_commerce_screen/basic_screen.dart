import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_list_tile.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../../../../custom_widgets/web_view.dart';
import '../Provider/subscription_history_plan+provider.dart';

class BasicScreen extends StatefulWidget {
  late int? planId;
  BasicScreen({Key? key, this.planId}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  void initState() {
    getDataStore();
    super.initState();
  }

  getDataStore() async {
    if (widget.planId == 8) {
      widget.planId = 8;
      setState(() {});
    } else if (widget.planId == 4) {
      widget.planId = 4;
      setState(() {});
    } else {
      widget.planId = 3;
      setState(() {});
    }
    // final GetSubscriptionPlanProvider provider =
    // Provider.of<GetSubscriptionPlanProvider>(context, listen: false);
    // await provider.getOrderSubscriptionHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final GetSubscriptionPlanProvider provider =
    // Provider.of<GetSubscriptionPlanProvider>(context);
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
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/back_arrow.svg',
                          height: 2.h,
                        )),
                    SizedBox(
                      width: 31.w,
                    ),
                    Text(
                      'Subscriptions',
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
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Text(
                'E-Commerce Basic',
                style: TextStyle(
                    color: blueColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                ),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 2),
                        BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            offset: Offset(-1, -1),
                            spreadRadius: 1,
                            blurRadius: 2),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomListTie(
                          text: 'Free Domain',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Commission %',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        // CustomListTie(
                        //   text: 'Free Deliveries',
                        //   widget: Text(
                        //     '3',
                        //     style: TextStyle(
                        //         fontSize: 10.sp,
                        //         color: Color(0xff535353),
                        //         fontWeight: FontWeight.bold
                        //     ),
                        //   ),
                        // ),
                        CustomListTie(
                          text: 'Orders & Inventory Management',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Customers Management',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Products Bulk Upload',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Connect your Domain Free',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),

                        CustomListTie(
                          text: 'Analytics & Reports',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Multiple Theme Layouts & Colors',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Whatsapp Integration & SEO tool',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: widget.planId == 8
                              ? 'Product Limit 500'
                              : widget.planId == 4
                                  ? 'Product Limit 1500'
                                  : 'Product Unlimited',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: widget.planId == 8
                              ? 'Store Staff 1'
                              : widget.planId == 4
                                  ? 'Store Staff 5'
                                  : 'Store Staff 10',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: '24/7 Support',
                          widget: SvgPicture.asset(
                            'assets/svgs/Subtract.svg',
                            height: 2.3.h,
                          ),
                        ),
                        CustomListTie(
                          text: 'Custom Theme (upon request)',
                          widget: widget.planId == 8
                              ? Icon(
                                  CupertinoIcons.clear,
                                  color: Colors.red,
                                  size: 16,
                                )
                              : SvgPicture.asset(
                                  'assets/svgs/Subtract.svg',
                                  height: 2.3.h,
                                ),
                        ),
                        CustomListTie(
                          text: 'Store Setup Visit with Training',
                          widget: widget.planId == 8
                              ? Icon(
                                  CupertinoIcons.clear,
                                  color: Colors.red,
                                  size: 16,
                                )
                              : SvgPicture.asset(
                                  'assets/svgs/Subtract.svg',
                                  height: 2.3.h,
                                ),
                        ),

                        SizedBox(
                          height: 1.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebView(
                          url:
                              'https://octanefashion.dialboxx.com/seller/make-payment/${widget.planId}',
                        ),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 5.2.h,
                    decoration: BoxDecoration(
                      color: Color(0xff005493),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Purchase',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
