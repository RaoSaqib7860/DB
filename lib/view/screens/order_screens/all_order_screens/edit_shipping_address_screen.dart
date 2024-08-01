import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../../../../custom_widgets/custom_toast.dart';
import '../Provider/all_order_peovider.dart';

class EditShippingAddressScreen extends StatefulWidget {
  String? orderId;
   EditShippingAddressScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<EditShippingAddressScreen> createState() => _EditShippingAddressScreenState();
}

class _EditShippingAddressScreenState extends State<EditShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final AllOrderProvider provider = Provider.of<AllOrderProvider>(
        context);
    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
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
                      SizedBox(width: 3.w,),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svgs/back_arrow.svg',height: 2.h,)),
                      SizedBox(width: 2.w,),
                      Text(
                        'Edit Shippng Address for Order No: ${widget.orderId}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  children: [
                    CustomLineTextField(name: 'Customer Name', hint: 'Hamza',controller: provider.nameController,),
                    CustomLineTextField(name: 'Customer Email', hint: 'hamza@hotmail.com',controller: provider.emailController,),
                    CustomLineTextField(name: 'Customer Phone',controller: provider.phoneController,),
                    CustomLineTextField(name: 'Zip Code',controller: provider.zipController,),
                    CustomLineTextField(name: 'Address',controller: provider.addressController,),
                    CustomLineTextField(name: 'Shipping Method',),
                    SizedBox(height: 10.h,),
                    GestureDetector(
                      onTap: () {
                        provider.update_order_detail_data(orderId: widget.orderId,context: context);

                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Container(
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
