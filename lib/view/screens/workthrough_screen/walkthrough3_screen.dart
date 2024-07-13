import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class WalkthroughThreeScreen extends StatefulWidget {
  const WalkthroughThreeScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughThreeScreen> createState() => _WalkthroughThreeScreenState();
}

class _WalkthroughThreeScreenState extends State<WalkthroughThreeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 17.h,),
        Image(image: AssetImage('assets/images/text3.png'),height: 8.h,),
        SizedBox(height: 8.h,),
        Container(
          height: 30.h,
          child: Image(image: AssetImage('assets/images/wt3.png')),
        )
      ],
    );
  }
}
