
import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_line_textfield.dart';
import 'Provider/get_store_info_provider.dart';

class StoreLocationScreen extends StatefulWidget {
  final int? inndex;
  const StoreLocationScreen({this.inndex,Key? key}) : super(key: key);

  @override
  State<StoreLocationScreen> createState() => _StoreLocationScreenState();
}

class _StoreLocationScreenState extends State<StoreLocationScreen> {
  @override
  void initState() {
    getDataStore();
    super.initState();
  }
  String dropdownvalue = 'Item 1';
  getDataStore() async {
    final GetAndUpdateStoreProvider provider =
    Provider.of<GetAndUpdateStoreProvider>(context, listen: false);
    await provider.getStoreInformation();
    provider.companyNameController.text = provider.getStoreInfoModel?.data?.location?.companyName?? '';
    provider.addressController.text = provider.getStoreInfoModel?.data?.location?.address?? '';
    provider.cityController.text = provider.getStoreInfoModel?.data?.location?.city?? '';
    provider.stateController.text = provider.getStoreInfoModel?.data?.location?.state?? '';
    provider.zipCodeController.text = provider.getStoreInfoModel?.data?.location?.zipCode?? '';
    provider.emailController.text = provider.getStoreInfoModel?.data?.location?.email?? '';
    provider.phoneController.text = provider.getStoreInfoModel?.data?.location?.phone?? '';
    provider.invoiceController.text = provider.getStoreInfoModel?.data?.location?.invoiceDescription?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final GetAndUpdateStoreProvider provider =
    Provider.of<GetAndUpdateStoreProvider>(context);
    return DataLoading(
      isLoading: provider.storeLocationLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w,),
          child:provider.getStoreInfoModel == null? SizedBox(): Column(
            children: [
              CustomLineTextField(name: 'Company',hint: 'DECORAY',controller: provider.companyNameController),
              CustomLineTextField(name: 'Address',hint: 'Office 1, Building1-C,Zamzama',controller: provider.addressController),
              CustomLineTextField(name: 'City',hint: 'Karachi',controller: provider.cityController),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'State',
                            style: TextStyle(color: Colors.black,fontSize: 10.sp),
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            height: 3.h,
                            //width: 40.w,
                            child: TextField(
                              controller: provider.stateController,
                              decoration: InputDecoration(
                                hintText: 'Sindh',
                                hintStyle: TextStyle(fontSize: 10.sp),
                                isDense: true,
                                contentPadding: EdgeInsets.only(bottom: 0.3.h),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h,),
                        ],
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Postal/Zip Code',
                            style: TextStyle(color: Colors.black,fontSize: 10.sp),
                          ),
                          SizedBox(height: 01.h,),
                          Container(
                            height: 3.h,
                            //width: 40.w,
                            child: TextField(
                              controller: provider.zipCodeController,
                              decoration: InputDecoration(
                                hintText: '7500',
                                hintStyle: TextStyle(fontSize: 10.sp),
                                isDense: true,
                                contentPadding: EdgeInsets.only(bottom: 0.3.h),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomLineTextField(name: 'Email',hint: 'abc@gmail.com',controller: provider.emailController),
              CustomLineTextField(name: 'Phone',hint: '12345666',controller: provider.phoneController),
              Padding(
                padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                child: Row(
                  children: [
                    Text(
                      'Invoice Discription',
                      style: TextStyle(color: Colors.black,fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding: EdgeInsets.only(left: 4.w,right: 4.w),
                child: Container(
                  height: 10.h,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    textAlign: TextAlign.left,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(fontSize: 12.sp),
                    controller: provider.invoiceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                      labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
                      hintStyle: TextStyle(fontSize: 10.sp),
                      contentPadding: EdgeInsets.only(top: 1.h,left: 2.w,right: 2.w),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.h,),
              Padding(
                padding: EdgeInsets.only(left: 4.w,right: 4.w),
                child: InkWell(
                  onTap: (){
                    provider.storeLocationApi();
                  },
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h,)
            ],
          ),
        ),
      ),
    );
  }
}
