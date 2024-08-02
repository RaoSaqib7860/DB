import 'dart:async';
import 'package:db_2_0/utils_services/storage_util.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../auth_screens/login_screen/Model/login_model.dart';
import '../auth_screens/sign_up_screen/sign_up_screen.dart';
import '../bottom_sheet/bottom_sheet.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print('objectnamw ');
    super.initState();
    if (storage.hasData('userData')) {
      print('objectnamw ');
      user_model = LoginModel.fromJson(storage.read('userData'));
      print('objectnamw ${user_model.data!.userId}');
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomSheetScreen(),
            ));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/app_logo.png'),
              height: 9.h,
            ),
          ],
        ),
      ),
    );
  }
}
