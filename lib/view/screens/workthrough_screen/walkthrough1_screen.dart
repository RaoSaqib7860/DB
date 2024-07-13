import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WalkthroughOneScreen extends StatefulWidget {
  const WalkthroughOneScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughOneScreen> createState() => _WalkthroughOneScreenState();
}

class _WalkthroughOneScreenState extends State<WalkthroughOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 17.h,),
        Image(image: AssetImage('assets/images/text1.png'),height: 8.h,),
        SizedBox(height: 10.h,),
        Container(
          height: 30.h,
          child: Stack(
            children: [
              Image(image: AssetImage('assets/images/wt1.png'),),
              Positioned(
                  bottom: 0,
                  right: 11.w,
                  child: Image(image: AssetImage('assets/images/wt1.1.png'))),
            ],
          ),
        )
      ],
    );
  }
}
