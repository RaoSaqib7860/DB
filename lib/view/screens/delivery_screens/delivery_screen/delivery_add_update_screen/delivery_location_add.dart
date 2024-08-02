import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../api_repository/api_utils.dart';
import '../../../../../custom_widgets/app_colors.dart';
import '../../../auth_screens/login_screen/Login Provider/login_model_globle.dart';

class DeliveryLocationAdd extends StatefulWidget {
  final int? city_id;
  final String? city_name;
  const DeliveryLocationAdd({super.key, this.city_id, this.city_name});

  @override
  State<DeliveryLocationAdd> createState() => _DeliveryLocationAddState();
}

class _DeliveryLocationAddState extends State<DeliveryLocationAdd> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = '${widget.city_name ?? ''}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/back_arrow.svg',
                        height: 2.h,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  'Create Location',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontSize: 12.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'Delivery Location Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withAlpha(170),
                      fontSize: 10.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  height: 3.h,
                  child: TextField(
                    controller: controller,
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Type here',
                        hintStyle: TextStyle(fontSize: 10.sp),
                        contentPadding: EdgeInsets.only(bottom: 1.6.h)),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 2.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () async {
                  if (widget.city_id == null) {
                    await DataProvider().delivery_locationApi_crud(map: {
                      'user_id': user_model.data!.id.toString(),
                      'method': 'add',
                      'title': controller.text
                    });
                  } else {
                    await DataProvider().delivery_locationApi_crud(map: {
                      'user_id': user_model.data!.id.toString(),
                      'method': 'update',
                      'city_id': widget.city_id.toString(),
                      'title': controller.text
                    });
                  }
                },
                child: Container(
                  height: 5.5.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
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
    );
  }
}
