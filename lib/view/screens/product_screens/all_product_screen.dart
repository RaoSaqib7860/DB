import 'package:db_2_0/view/screens/product_screens/publish_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import '../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import 'Provider/all_product_provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 3.2.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.index = 1;
                    });
                    provider.get_product_data(map: {
                      'user_id': '${user_model.data!.userId}',
                      'type': '${provider.index}'
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: provider.index == 1 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color:
                                provider.index == 1 ? blueColor : Colors.black,
                            width: 1)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      child: Text(
                        'Publish '.tr + '(${provider.allProductModel?.data?.actives ?? ''})',
                        style: TextStyle(
                            color: provider.index == 1
                                ? Colors.white
                                : Colors.black,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.index = 2;
                    });
                    provider.get_product_data(map: {
                      'user_id': '${user_model.data!.userId}',
                      'type': '${provider.index}'
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: provider.index == 2 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color:
                                provider.index == 2 ? blueColor : Colors.black,
                            width: 1)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      child: Text(
                        'Draft '.tr + '(${provider.allProductModel?.data?.drafts ?? ''})',
                        style: TextStyle(
                          color:
                              provider.index == 2 ? Colors.white : Colors.black,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.index = 3;
                    });
                    provider.get_product_data(map: {
                      'user_id': '${user_model.data!.userId}',
                      'type': '${provider.index}'
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: provider.index == 3 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color:
                                provider.index == 3 ? blueColor : Colors.black,
                            width: 1)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      child: Text(
                        'Incomplete '.tr + '(${provider.allProductModel?.data?.incomplete ?? ''})',
                        style: TextStyle(
                            color: provider.index == 3
                                ? Colors.white
                                : Colors.black,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      provider.index = 0;
                    });
                    provider.get_product_data(map: {
                      'user_id': '${user_model.data!.userId}',
                      'type': '${provider.index}'
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: provider.index == 0 ? blueColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color:
                                provider.index == 0 ? blueColor : Colors.black,
                            width: 1)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.6.h),
                      child: Text(
                        'Trash '.tr + '(${provider.allProductModel?.data?.trash ?? ''})',
                        style: TextStyle(
                            color: provider.index == 4
                                ? Colors.white
                                : Colors.black,
                            fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Expanded(child: PublishScreen())
      ],
    );
  }
}
