import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import 'Provider/subscription_history_plan+provider.dart';
import 'e_commerce_screen/basic_screen.dart';
import 'e_commerce_screen/enterprise_screen.dart';
import 'e_commerce_screen/order_detail_screen.dart';
import 'e_commerce_screen/plus_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  double? monthlyPayment;
  double? monthlyPaymentSecond;
  @override
  void initState() {
    getDataStore();
    super.initState();
  }
  getDataStore() async {
    final GetSubscriptionPlanProvider provider =
    Provider.of<GetSubscriptionPlanProvider>(context, listen: false);
    await provider.getSubscriptionHistoryApiFunction();
    await provider.getOrderSubscriptionHistory();
    monthlyPayment = (provider.getSubscriptionPlanHistoryModel!.data![0].price! / 12);
    monthlyPaymentSecond = (provider.getSubscriptionPlanHistoryModel!.data![1].price! / 12);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final GetSubscriptionPlanProvider provider =
    Provider.of<GetSubscriptionPlanProvider>(context);
    return DataLoading(
      isLoading: provider.loading!,
      child: Scaffold(
        body:provider.getSubscriptionPlanHistoryModel == null && provider.getSubscriptionOrderHistoryModel == null? SizedBox(): SingleChildScrollView(
          child: Container(
            // height: 100.h,
            // width: 100.w,
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
                            'Subscription Plan',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 2.w,),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 2.h,),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 4.w,),
                //   child: Text(
                //     'Plan',
                //     style: TextStyle(
                //         color: blueColor,
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.bold
                //     ),
                //   ),
                // ),
                SizedBox(height: 2.h,),
                customContainer(
                  topText: 'Best Seller',
                  subName: '${provider.getSubscriptionPlanHistoryModel!.data![0].name}',
                  description: '${provider.getSubscriptionPlanHistoryModel!.data![0].description}',
                  price: ' ${provider.getSubscriptionPlanHistoryModel!.data![0].price} ',
                  validText: '${provider.getSubscriptionPlanHistoryModel!.data![0].days}',
                  commissionText: 'Zero % Commission',
                  costText: monthlyPayment !=null?'${monthlyPayment!.toInt()}':'',
                  purchaseText: 'Purchase',
                  purchaseIcon: Icons.arrow_forward,
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BasicScreen(),));
                  },
                ),
                customContainer(
                    subName: '${provider.getSubscriptionPlanHistoryModel!.data![1].name}',
                    description: '${provider.getSubscriptionPlanHistoryModel!.data![1].description}',
                    price: ' ${provider.getSubscriptionPlanHistoryModel!.data![1].price}',
                    validText: '${provider.getSubscriptionPlanHistoryModel!.data![1].days}',
                    commissionText: 'Zero % Commission',
                    costText: monthlyPaymentSecond != null? '${monthlyPaymentSecond!.toInt()}' :'',
                    purchaseText: 'Purchase',
                    purchaseIcon: Icons.arrow_forward,
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlusScreen(),));
                  },
                ),
                customContainer(
                    subName: '${provider.getSubscriptionPlanHistoryModel!.data![2].name}',
                    description: '${provider.getSubscriptionPlanHistoryModel!.data![2].description}',
                    price: ' ${provider.getSubscriptionPlanHistoryModel!.data![2].price} ',
                    validText: '${provider.getSubscriptionPlanHistoryModel!.data![2].days}',
                    commissionText: 'Zero % Commission',
                    //costText: '2,083',
                    purchaseText: 'Contact us',
                    purchaseIcon: Icons.phone_enabled,
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EnterpriseScreen(),));
                  },
                ),
                //SizedBox(height: 2.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w,),
                  child: Text(
                    'Order History',
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 2.h,),
                Container(
                    height: 30.h,
                    child: ListView.builder(itemCount: provider.getSubscriptionOrderHistoryModel?.data?.length ?? 0,itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w,),
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
                        padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 0.5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order #${provider.getSubscriptionOrderHistoryModel!.data![index].orderNo}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11.sp
                                  ),
                                ),
                                Text(
                                  "${DateFormat('dd-MMM-yyyy').format(DateTime.parse('${provider.getSubscriptionOrderHistoryModel!.data![index].createdAt}'))}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                            //SizedBox(height: 0.5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top: 0.5.h),
                                  child: Text(
                                    "E-commerce",
                                    style: TextStyle(
                                        color: redColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Color(0xffF0C9D0),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.2.h),
                                    child: Text(
                                      '${provider.getSubscriptionOrderHistoryModel!.data![index].amount}',
                                      style: TextStyle(
                                          color: redColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 0.5.h,),
                            Text(
                              "Basic",
                              style: TextStyle(
                                  color: redColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Payment: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: blueColor
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.2.h),
                                        child: Text(
                                          "${provider.getSubscriptionOrderHistoryModel!.data![index].typeP}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Status: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: blueColor
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.2.h),
                                        child: Text(
                                          "${provider.getSubscriptionOrderHistoryModel!.data![index].ppStatus}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              thickness: 0.8,
                              color: Color(0xff707070),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailScreen(),));
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svgs/action.svg',height: 3.h,),
                                      SizedBox(width: 2.w,),
                                      Text(
                                        "Action",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10  .sp
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "TAX - Rs: ${provider.getSubscriptionOrderHistoryModel!.data![index].tax} ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9.sp
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Account Status:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9.sp
                                      ),
                                    ),
                                    SizedBox(height: 0.3.h,),
                                    Text(
                                      "Approved",
                                      style: TextStyle(
                                          color: blueColor,
                                          fontSize: 10.sp
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
                  );
                },)),
                SizedBox(height: 2.h,),
              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget customContainer(
  {
    String? topText,
    String? subName,
    String? description,
    String? price,
    String? validText,
    String? commissionText,
    String? costText,
    String? purchaseText,
    IconData? purchaseIcon,
    Function()? ontap
}
      ){
    return Column(
      children: [
        Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w,),
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
                child: Column(
                  children: [
                    if(topText != null)
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(3),topRight:  Radius.circular(3),)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            topText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      subName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w,),
                      child: Text(
                        description!,
                        style: TextStyle(
                          color: Color(0xff2E3630),
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Pay ',
                                style: TextStyle(
                                  color: Color(0xff2E3630),
                                  fontSize: 11.sp,
                                ),
                              ),
                              TextSpan(
                                text: price!,
                                style: TextStyle(
                                    color: Color(0xff2E3630),
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              TextSpan(
                                text: '/ Yearly ',
                                style: TextStyle(
                                  color: Color(0xff2E3630),
                                  fontSize: 11.sp,
                                ),
                              ),
                            ]
                        )),
                    SizedBox(height: 1.h,),
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Valid for : ',
                                style: TextStyle(
                                  color: Color(0xff2E3630),
                                  fontSize: 10.sp,
                                ),
                              ),
                              TextSpan(
                                text: validText,
                                style: TextStyle(
                                    color: Color(0xff2E3630),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
                        )
                    ),
                    SizedBox(height: 0.5.h,),
                    Text(
                      commissionText!,
                      style: TextStyle(
                        color: Color(0xff2E3630),
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 0.5.h,),
                    if(costText != null)
                    Text(
                      'Cost Rs. $costText Per Month',
                      style: TextStyle(
                        color: Color(0xff2E3630),
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 4.w,),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: ontap,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(width: 1,color: Colors.black)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.5.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          'View Features',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        SizedBox(width: 1.w,),
                                        Icon(Icons.remove_red_eye,color: Colors.black,size: 2.5.h,),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 3.w,),
                          Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: redColor
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 6.w,top: 0.5.h,bottom: 0.5.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        purchaseText!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(width: 2.w,),
                                      Icon(purchaseIcon,color: Colors.white,size: 2.8.h,),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,),
                  ],
                ),
              ),
            )
        ),
        SizedBox(height: 2.h,)
      ],
    );
  }

}
