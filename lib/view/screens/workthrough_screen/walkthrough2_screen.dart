import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class WalkthroughTwoScreen extends StatefulWidget {
  const WalkthroughTwoScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughTwoScreen> createState() => _WalkthroughTwoScreenState();
}

class _WalkthroughTwoScreenState extends State<WalkthroughTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 17.h,),
        Image(image: AssetImage('assets/images/text2.png'),height: 8.h,),
        SizedBox(height: 7.h,),
        Container(
          height: 28.h,
          child: Image(image: AssetImage('assets/images/wt2.png'),fit: BoxFit.cover,),
        )
      ],
    );
  }
}
