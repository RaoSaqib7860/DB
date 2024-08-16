import 'package:db_2_0/view/screens/account_screen/store_setting_screen/Provider/get_store_info_provider.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_provider.dart';
import 'package:db_2_0/view/screens/auth_screens/signup_detail_screen/SignUp%20Provider/sign_up_provider.dart';
import 'package:db_2_0/view/screens/home_screen/DashBoard%20Provider/dashboard_provider.dart';
import 'package:db_2_0/view/screens/home_screen/Update%20Store%20Setup/update_store_provider.dart';
import 'package:db_2_0/view/screens/order_screens/Provider/all_order_peovider.dart';
import 'package:db_2_0/view/screens/product_screens/Provider/add_product_provider.dart';
import 'package:db_2_0/view/screens/product_screens/Provider/all_product_provider.dart';
import 'package:db_2_0/view/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'view/screens/delivery_screens/povider/delivery_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => AllProductProvider()),
        ChangeNotifierProvider(create: (_) => AllOrderProvider()),
        ChangeNotifierProvider(create: (_) => AddProductProvider()),
        ChangeNotifierProvider(create: (_) => DeliveryProvider()),
        ChangeNotifierProvider(create: (_) => UpdateStoreProvider()),
        ChangeNotifierProvider(create: (_) => GetAndUpdateStoreProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      },
    );
  }
}
