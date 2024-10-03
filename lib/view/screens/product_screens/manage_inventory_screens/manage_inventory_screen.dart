import 'package:db_2_0/view/screens/product_screens/manage_inventory_screens/total_inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import 'Provider/inventory_provider.dart';

class ManageInventoryScreen extends StatefulWidget {
  const ManageInventoryScreen({Key? key}) : super(key: key);

  @override
  State<ManageInventoryScreen> createState() => _ManageInventoryScreenState();
}

class _ManageInventoryScreenState extends State<ManageInventoryScreen> {
  int ind = 0;
  List list = ['Total', 'In Stock', 'Stock Out'];

  @override
  Widget build(BuildContext context) {
    final GetInventoryProvider provider =
        Provider.of<GetInventoryProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 3.2.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ind = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ind == index ? blueColor : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: ind == index ? blueColor : Colors.black,
                                width: 1)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.6.h),
                          child: Text(
                            "${list[index]} ${index == 0 ? "(${provider.getInvontoryModel?.data?.length ?? '0'})" : ""}",
                            style: TextStyle(
                                color:
                                    ind == index ? Colors.white : Colors.black,
                                fontSize: 10.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        if (ind == 0)
          const Expanded(
              child: TotalInventoryScreen(
            index: 0,
          )),
        if (ind == 1)
          const Expanded(
              child: TotalInventoryScreen(
            index: 1,
          )),
        if (ind == 2)
          const Expanded(
              child: TotalInventoryScreen(
            index: 2,
          ))
      ],
    );
  }
}
