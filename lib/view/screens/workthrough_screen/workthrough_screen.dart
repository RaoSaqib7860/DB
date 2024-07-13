import 'package:db_2_0/view/screens/workthrough_screen/walkthrough1_screen.dart';
import 'package:db_2_0/view/screens/workthrough_screen/walkthrough2_screen.dart';
import 'package:db_2_0/view/screens/workthrough_screen/walkthrough3_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/app_colors.dart';
import '../auth_screens/login_screen/login_screen.dart';
import '../auth_screens/sign_up_screen/sign_up_screen.dart';
import '../splash_screen/splash_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {

  final PageController _pageController = PageController(initialPage: 0);
  int activePage = 0;
  final List<Widget> pages = [
    WalkthroughOneScreen(),
    WalkthroughTwoScreen(),
    WalkthroughThreeScreen(),
  ];
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 50.h,
            width: 100.w,
            child: Image(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 70.3.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        activePage = value;
                      });
                    },
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return pages[index% pages.length];
                    },),
                ),
                SizedBox(height: 16.h,),
                Container(
                  //color: Color(0xffe9eaef),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.8.w),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 0.6.h,
                          backgroundColor:activePage == index? blueColor :redColor,
                        ),
                      ),
                    ),),
                  ),
                ),
                SizedBox(height: 2.h,),
                GestureDetector(
                  onTap: () {
                    if(ind == 0){
                      ind = 1;
                      _pageController.animateToPage(ind, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                      setState(() {

                      });
                    }
                    else if(ind == 1){
                      ind = 2;
                      _pageController.animateToPage(ind, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                      setState(() {

                      });
                    }
                    else if(ind == 2)
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already a Member? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp
                          )
                        ),
                        TextSpan(
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                            text: 'Login' ,
                            style: TextStyle(
                                color: Color(0xffAD172A),
                                fontSize: 14.sp,
                              fontWeight: FontWeight.bold
                            )
                        )
                      ]
                    )
                ),
                SizedBox(height: 1.h,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
