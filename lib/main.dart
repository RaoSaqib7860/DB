import 'package:db_2_0/view/screens/auth_screens/forgot_password_screen/Forget%20Provider/foget_provider.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_provider.dart';
import 'package:db_2_0/view/screens/auth_screens/signup_detail_screen/SignUp%20Provider/sign_up_provider.dart';
import 'package:db_2_0/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void main() async{
 await GetStorage.init();
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ChangeNotifierProvider(create: (_) => ForgetOtpProvider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'DB',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        //BottomSheetScreen(),
        SplashScreen(),
        //SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
    },);
  }
}


