import 'dart:async';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../api_repository/api_utils.dart';
import '../confirm_password_screen/confirm_password_screen.dart';
import 'Forget Provider/foget_provider.dart';

class OtpScreens extends StatefulWidget {
  final String? email;
  final String? number;
  final String? password;
  final bool? just_verification;

  OtpScreens({
    Key? key,
    this.email,
    this.password,
    this.number,
    this.just_verification=false,
  }) : super(key: key);

  @override
  _OtpScreensState createState() => _OtpScreensState();
}

class _OtpScreensState extends State<OtpScreens> {
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  bool isotp = false;

  final formKey = GlobalKey<FormState>();
  Timer? _timer;
  int second = 30;

  void startTimer() {
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(onesec, (timer) {
      setState(() {
        if (second < 1) {
          isotp = false;
          second = 30;
          _timer!.cancel();
        } else {
          second = second - 1;
          if (isotp == false) {
            isotp = true;
          }
        }
      });
    });
  }

  // @override
  // void initState() {
  //   onTapRecognizer = TapGestureRecognizer()
  //     ..onTap = () {
  //       Navigator.pop(context);
  //     };
  //   errorController = StreamController<ErrorAnimationType>();
  //   super.initState();
  // }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ForgetOtpProvider>(context);
    var height = Get.height;
    var width = Get.width;
    return DataLoading(
      isLoading: _provider.loading,
      child: SafeArea(
        child: Listener(
          onPointerDown: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.black,
            appBar: AppBar(
                backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.black,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            body: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  padding: EdgeInsets.only(left: width / 15, right: width / 15),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height / 7,
                      ),
                      Center(
                          child: Text(
                        'Verify Code',
                        style: TextStyle(
                            fontSize: 19,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600),
                      )),
                      SizedBox(
                        height: height / 30,
                      ),
                      Center(
                        child: SizedBox(
                          width: width / 1.4,
                          child: Column(
                            children: [
                              Text(
                                'Please check your messages or email & enter the verification code we just sent you to',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '${widget.number} 0r ${widget.email}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                              length: 6,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(6),
                              ],
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 5) {
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                //inactiveColor: offBlackAvatr,
                                //inactiveFillColor: offBlackAvatr,
                                fieldHeight: 50,
                                //activeColor: offBlackAvatr,
                                fieldWidth: 40,
                                activeFillColor:
                                    hasError ? Colors.black : Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white:Colors.black,
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              onCompleted: (v) async {
                                _provider.loading = true;
                                setState(() {

                                });
                                bool result = await DataProvider().verifyOtpSendFunction(map: {
                                  'otp': textEditingController.text,
                                  'email': widget.email,
                                });
                                _provider.loading = true;
                                setState(() {

                                });
                                if (result) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPasswordScreen(),));
                                  Get.snackbar('Success','Verify Successfully');
                                }

                              },
                              onChanged: (value) {
                                setState(() {
                                  currentText = value;
                                });
                              },
                              appContext: context,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          hasError
                              ? "Please fill up all the cells properly"
                              : "",
                          style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      InkWell(
                        child: Center(
                            child: Text(
                          'Clear Text',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
                          ),
                        )),
                        onTap: () {
                          textEditingController.clear();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Didn\'t receive the code? ',
                            style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black, fontSize: 13),
                          ),
                          InkWell(
                            // onTap: () async {
                            //   if (isotp == false) {
                            //     _provider.setloading(true);
                            //     startTimer();
                            //     await DataProvider.auth_resend_code({
                            //       'phone': widget.number,
                            //     });
                            //     _provider.setloading(false);
                            //     snackBarSuccess('Otp sent to the email'.tr);
                            //   }
                            // },
                            child: Text(
                                isotp == false
                                    ? 'RESEND'
                                    : 'Wait 30 seconds = ',
                                style: TextStyle(
                                    color: isotp == false
                                        ? Theme.of(context).brightness == Brightness.dark ? Colors.green:Colors.blue
                                        : Theme.of(context).brightness == Brightness.dark ? Colors.white:Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                          ),
                          Text(isotp == false ? '' : '00:$second',
                              style: TextStyle(
                                  //color: offBlackAvatr,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
                // _provider.loading == true
                //     ? InkWell(
                //         onTap: () {
                //           _provider.setloading(false);
                //         },
                //         child: Container(
                //           height: height,
                //           width: width,
                //           child: Center(
                //             child: screenLoader(use_opacity: false),
                //           ),
                //           decoration:
                //               BoxDecoration(color: Colors.black.withOpacity(0.5)),
                //         ),
                //       )
                //     : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

