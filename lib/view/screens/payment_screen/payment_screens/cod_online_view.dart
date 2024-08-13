import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_model_globle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../utils_services/storage_util.dart';
import '../../auth_screens/login_screen/Model/login_model.dart';

class CODAndOnline extends StatefulWidget {
  final String? type;
  const CODAndOnline({super.key, this.type});

  @override
  State<CODAndOnline> createState() => _CODAndOnlineState();
}

class _CODAndOnlineState extends State<CODAndOnline> {
  bool isSelect = false;
  bool _value = false;
  int ind = 0;

  TextEditingController name_controller = TextEditingController();
  TextEditingController detail_controller = TextEditingController();

  @override
  void initState() {
    name_controller.text = widget.type == 'cod' ? 'COD' : 'Bank Transfer';
    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Display name at checkout',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  height: 3.h,
                  width: 90.w,
                  child: TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                      hintText: ' Name',
                      hintStyle: TextStyle(
                          fontSize: 10.sp, color: Colors.black.withAlpha(170)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  'Customers will see this when checking out.',
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Color(0xff8E8E8E),
                    //fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Additional Details',
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 3.h,
                  child: TextField(
                    controller: detail_controller,
                    decoration: InputDecoration(
                      hintText: ' Type here',
                      hintStyle: TextStyle(
                          fontSize: 10.sp, color: Colors.black.withAlpha(170)),
                      //contentPadding: EdgeInsets.only(top: 0.002.h,left: 2.w)
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  'Displayed on the Payment method page, while the customer\nis choosing how to pay.',
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Color(0xff8E8E8E),
                    //fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    FlutterSwitch(
                      width: 10.w,
                      height: 2.5.h,
                      valueFontSize: 25.0,
                      toggleSize: 2.5.h,
                      value: _value,
                      borderRadius: 30.0,
                      inactiveSwitchBorder:
                          Border.all(color: blueColor, width: 0.7),
                      padding: 1,
                      showOnOff: false,
                      activeColor: blueColor,
                      inactiveColor: Color(0xffD9D9D9),
                      onToggle: (val) {
                        setState(() {
                          _value = val;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        'Enable',
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 4.8.h,
                        width: 26.w,
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () async {
                        loading = true;
                        setState(() {});
                        var data =
                            await DataProvider().add_paymentgatewayApi(map: {
                          'user_id': '${user_model.data!.id}',
                          'slug': widget.type == 'cod' ? 'cod' : 'bank',
                          'additional_details': detail_controller.text,
                          'status': _value ? '1' : '2',
                          'id': widget.type == 'cod' ? '152' : '2',
                        });
                        if (data == true) {
                          var data = await storage.read('userData');
                          print('${data}');
                          LoginModel loginModel = LoginModel.fromJson(data);
                          loginModel.data!.isPaymentMethod = 1;
                          storage.write('userData', loginModel.toJson());
                        }
                        loading = false;
                        setState(() {});
                      },
                      child: Container(
                        height: 4.8.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
