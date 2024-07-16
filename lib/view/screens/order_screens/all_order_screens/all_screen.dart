import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../Provider/all_order_peovider.dart';
import '../create_order_screen.dart';
import 'all_order_detail_screen.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  void initState() {
    final AllOrderProvider provider =
    Provider.of<AllOrderProvider>(context, listen: false);
    provider.get_order_data();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final AllOrderProvider provider = Provider.of<AllOrderProvider>(
        context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ListView.builder(
            itemCount: provider.allOrderModel!.data!.orders!.length,
            itemBuilder: (context, index) {
              return DataLoading(
                isLoading: provider.loading,
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
                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order ${provider.allOrderModel!.data!.orders![index].orderNo}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Items: ${provider.allOrderModel!.data!.orders![index].orderItemsCount}',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '14-feb-2024',
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Customer name:',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color(0xff5B5B5B),
                                  ),
                                ),
                                Container(
                                  color: Color(0xffF0C9D0),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                                    child: Text(
                                      'Rs1,500.00',
                                      style: TextStyle(
                                          color: redColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 1.h,),
                            Text(
                              'Hamza',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: redColor,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Fulfillment:',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 0.6.w,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.3.h),
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Payment:',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 0.6.w,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: blueColor,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.3.h),
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            //SizedBox(height: 1.h,),
                            Divider(
                              thickness: 1,
                              color: Colors.black26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Customer type',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Color(0xff5B5B5B),
                                      ),
                                    ),
                                    SizedBox(height: 0.2.h,),
                                    Text(
                                      'Existing',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: blueColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset('assets/svgs/frame.svg',height: 3.7.h,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllOrderDetailScreen(),));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(width: 1,color: Color(0xff707070))
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 1.w,),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Details',
                                            style: TextStyle(
                                              color: Color(0xff858585),
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(width: 2.5.w,),
                                          Icon(Icons.keyboard_arrow_right_sharp,color: Colors.black,size: 2.3.h,)
                                        ],
                                      ),
                                    ),
                                  ),
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
            },),
        ),
        // Positioned(
        //   bottom: 1.h,
        //   child: Padding(
        //     padding:  EdgeInsets.symmetric(horizontal: 5.w),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) => CreateOrderScreen(),));
        //       },
        //       child: Container(
        //         height: 5.5.h,
        //         width: 90.w,
        //         decoration: BoxDecoration(
        //           color: Color(0xff005493),
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         child: Center(
        //           child: Text(
        //             'Create Order',
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 13.sp,
        //                 fontWeight: FontWeight.bold
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
