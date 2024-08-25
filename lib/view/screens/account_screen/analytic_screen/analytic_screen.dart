import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_dialogue.dart';
import 'Provider/get_analytics_provider.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {

  @override
  void initState() {
    getDataStore();
    super.initState();
  }
  final List<ChartData> chartData = [];
  getDataStore() async {
    final GetAnalyticsProvider provider =
    Provider.of<GetAnalyticsProvider>(context, listen: false);
    await provider.getAnalyticsApiFunction();
    await provider.getOrderHistoryFunction();

    provider.getAnalyticsModel!.data!.browsers!.toJson().forEach((key, value) {
      chartData.add(ChartData('${key}', double.parse('${value}')),);
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final GetAnalyticsProvider provider =
    Provider.of<GetAnalyticsProvider>(context);
    return DataLoading(
      isLoading: provider.loading!,
      child: Scaffold(
        body:provider.getOrserHistoryModel == null && provider.getAnalyticsModel == null? SizedBox(): SingleChildScrollView(
          child: Container(
            // height: 100.h,
            // width: 100.w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 7.h,
                    width: 100.w,
                    color: blueColor,
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
              
                            Text(
                              'Analytics'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 2.w,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'Report'.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: customContainer(
                              image: 'bag',
                              title: 'Total Order'.tr,
                              subTitle: '${provider.getOrserHistoryModel!.data!.total}',
                              color: Color(0xff1568A8)
                            )
                        ),
                        SizedBox(width: 3.w,),
                        Expanded(
                            child: customContainer(
                                image: 'cancel',
                                title: 'Order Cancelled'.tr,
                                subTitle: '${provider.getOrserHistoryModel!.data!.canceled}',
                                color: Color(0xff9B001E)
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: customContainer(
                                image: 'bag',
                                title: 'In Processing'.tr,
                                subTitle: '${provider.getOrserHistoryModel!.data!.proccess}',
                                color: Color(0xffD09611)
                            )
                        ),
                        SizedBox(width: 3.w,),
                        Expanded(
                            child: customContainer(
                                image: 'alll',
                                title: 'Order Complete'.tr,
                                subTitle: '${provider.getOrserHistoryModel!.data!.completed}',
                                color: Color(0xff0CA011),
                              imageSize: 1.7.h
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: customContainer(
                        image: 'bag',
                        title: 'Total Amount'.tr,
                        subTitle: '${provider.getOrserHistoryModel!.data!.amounts}',
                        color: Color(0xff1568A8)
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: customContainer(
                        image: 'amount',
                        title: 'Canceled Amount',
                        subTitle: '${provider.getOrserHistoryModel!.data!.amountCancel}',
                        color: Color(0xff9B001E),
                      imageSize: 1.7.h
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: customContainer(
                        image: 'amount',
                        title: 'Pending Amount',
                        subTitle: '${provider.getOrserHistoryModel!.data!.amountProccess}',
                        color: Color(0xff9D09611),
                        imageSize: 1.7.h
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: customContainer(
                        image: 'amount',
                        title: 'Earning Amount',
                        subTitle: '${provider.getOrserHistoryModel!.data!.amountCompleted}',
                        color: Color(0xff0CA011),
                        imageSize: 1.7.h
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              customDialogue(
                                  context: context,
                                  height: 33.h,
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
                                              'Apply Filter'.tr,
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
                                          'Filter by date'.tr,
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
                                              'Starting date'.tr,
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
                                              'End date'.tr,
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
                                                'Reset Filter'.tr,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                      height: 38.h,
                      child: ListView.builder(itemCount: provider.getOrserHistoryModel?.data?.orders?.dataOf?.length ?? 0,itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
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
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invoice No'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        '${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].orderNo}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Customer'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        '${provider.getOrserHistoryModel?.data?.orders?.dataOf?[index].customer?.name ?? ''}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Payment'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Container(
                                        color: Colors.green,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                          child: Text(
                                            '${provider.payment_status['${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].paymentStatus}']}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.sp
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Item (s)',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        '${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].orderItemsCount}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 23.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        '${DateFormat('dd-MMM-yyyy').format(DateTime.parse('${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].createdAt}'))}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Order total'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        '${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].total}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Fulfillment'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Container(
                                        color: Colors.green,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                          child: Text(
                                            '${provider.getOrserHistoryModel!.data!.orders!.dataOf![index].status}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.sp
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Text(
                                        'Invoice'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h,),
                                      Container(
                                        color: Color(0xff9B001E),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 0.6.w, vertical: 0.1.h),
                                          child: Icon(Icons.remove_red_eye,color: Colors.white,size: 2.2.h,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                      ],
                    );
                  },)),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'Traffic'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child:  SfCircularChart(
                      legend: Legend(isVisible: true,
                      position: LegendPosition.left
                      ),


                        series: <CircularSeries>[
                          // Render pie chart
                          PieSeries<ChartData, String>(
                              dataSource: chartData,
                              pointColorMapper:(ChartData data,  _) => data.color,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y
                          )
                        ]
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Container(
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
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Most Visit Pages'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image(image: AssetImage('assets/images/chrome.png'),height: 7.h,width: 14.w,),
                                      SizedBox(height: 1.h,),
                                      Text(
                                        'Chrome'.tr,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.browsers!.chrome}',
                                        style: TextStyle(
                                            color: Color(0xff6F6F6F),
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(image: AssetImage('assets/images/safari.png'),height: 7.h,width: 14.w,),
                                      SizedBox(height: 1.h,),
                                      Text(
                                        'Safari'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.browsers!.safari}',
                                        style: TextStyle(
                                            color: Color(0xff6F6F6F),
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(image: AssetImage('assets/images/fire.png'),height: 7.h,width: 14.w,),
                                      SizedBox(height: 1.h,),
                                      Text(
                                        'Firefox'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.browsers!.firefox}',
                                        style: TextStyle(
                                            color: Color(0xff6F6F6F),
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image(image: AssetImage('assets/images/edge.png'),height: 7.h,width: 14.w,),
                                      SizedBox(height: 1.h,),
                                      Text(
                                        'Edge'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.browsers!.edge}',
                                        style: TextStyle(
                                            color: Color(0xff6F6F6F),
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
              
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Container(
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
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Visitors'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.vistors}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        'Total Pages Visited'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
              
                                      Text(
                                        '${provider.getAnalyticsModel!.data!.uniqueVistors}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        'Unique Visitors'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '640 mins',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        'Total Time Spent'.tr,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 9.sp
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
              
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customContainer({String? image, String? title, String? subTitle, Color? color, double? imageSize}){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.2.h),
        child: Row(
          children: [
            Container(
              height: 5.h,
              width: 10.w,
              color: color,
              child: Center(
                child: SvgPicture.asset('assets/svgs/$image.svg',height: imageSize != null ? imageSize : 2.5.h,),
              ),
            ),
            SizedBox(width: 3.w,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 9.sp
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                      subTitle!.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
