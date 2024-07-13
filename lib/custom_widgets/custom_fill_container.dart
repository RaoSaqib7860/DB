import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

Widget customFillContainer(){
  return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: blueColor,),
          shape: BoxShape.circle
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SvgPicture.asset('assets/svgs/filll.svg',height: 1.8.h,),
      ));
}