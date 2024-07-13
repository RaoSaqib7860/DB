import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_container.dart';
import '../../../../custom_widgets/custom_textfield.dart';
import '../login_screen/login_screen.dart';
import 'SignUp Provider/sign_up_provider.dart';

class SignUpDetailScreen extends StatefulWidget {
  final String? email;
  final String? mobile;
   SignUpDetailScreen({Key? key,this.email, this.mobile}) : super(key: key);

  @override
  State<SignUpDetailScreen> createState() => _SignUpDetailScreenState();
}

class _SignUpDetailScreenState extends State<SignUpDetailScreen> {
  SignUpProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<SignUpProvider>(context, listen: false);
    provider!.emailController = TextEditingController(text: widget.email);
    provider!.mobileController = TextEditingController(text: widget.mobile);
  }
  @override
  Widget build(BuildContext context) {
    final SignUpProvider provider = Provider.of<SignUpProvider>(context);
    return DataLoading(
      isLoading: provider.loading,
      child: Scaffold(
        body: CustomContainer(
          widgets: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  SizedBox(height: 9.h,),
                  Image(image: AssetImage('assets/images/app_logo.png'),height: 8.h,),
                  SizedBox(height: 3.h,),
                  Text(
                    'Enter business details',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Text(
                        'Email *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextField(
                    hintText: 'Enter Email',
                    filled: true,
                    fillColor: Colors.grey.withAlpha(100),
                    controller: provider.emailController,
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Business Name *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextField(
                    hintText: 'Enter Business Name',
                    controller: provider.businessNameController,
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Mobile Number *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextField(
                    hintText: 'Enter mobile number',
                    controller: provider.mobileController,
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Select Category *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  GestureDetector(
                    onTap: () {
                        showModalBottomSheet(
                            context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

                          ),
                          isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),
                                        child: Container(
                                          height: 85.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
                                          ),
                                          child: Scaffold(
                                            body: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Select Category',
                                                      style: TextStyle(
                                                        color: blueColor,
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    SizedBox(height: 2.h,),
                                                    Expanded(
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                              children: provider.list_of_category.map((e) {

                                                                return InkWell(
                                                                  child: provider.list.contains(provider.list_of_category.indexOf(e))
                                                                      ? selected_checkboxContainer(text: '$e')
                                                                      : checkboxContainer(text: '$e'),
                                                                  onTap: () {
                                                                    //selected_interest = e;
                                                                    if(provider.list.contains(provider.list_of_category.indexOf(e))){
                                                                      provider.list.remove(provider.list_of_category.indexOf(e));
                                                                      provider.selected_categgory = e;
                                                                      provider.index = provider.list_of_category.indexOf(e);
                                                                      setState(() {});
                                                                    }
                                                                    else{
                                                                      provider.list.add(provider.list_of_category.indexOf(e));
                                                                      provider.selected_categgory = e;
                                                                     // setState(() {});
                                                                    }
                                                                    setState(() {});
                                                                  },

                                                                );
                                                              }).toList()),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            bottomNavigationBar: Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 4.w),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if(provider.selected_categgory != null){

                                                        selected_checkboxContainer(text: provider.selected_categgory!);
                                                        provider.updateState();

                                                    }

                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 5.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: blueColor
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                ),
                              );
                            },
                        );
                    },
                    child: Container(
                      height: 4.5.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80.w,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                    provider.selected_categgory !=null ? provider.selected_categgory!:'Select business industry',
                                    style: TextStyle(color: Colors.black54,fontSize: 11.sp)
                                ),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black54,size: 3.5.h,),
                          ],
                        )
                        // DropdownButton(
                        //   isExpanded: true,
                        //   value: dropdownvalue,
                        //   underline: Container(),
                        //   items: items.map((String items) {
                        //     return DropdownMenuItem(
                        //       value: items,
                        //       child: Text(items,style: TextStyle(color: Colors.black54,fontSize: 11.sp),),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       dropdownvalue = newValue!;
                        //     });
                        //   },
                        //   hint: const Text(
                        //     "Font Family",
                        //     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Select Subscription *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  Container(
                    height: 4.5.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'E-commerce Website',
                              style: TextStyle(color: Colors.black54,fontSize: 11.sp)
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black54,size: 3.5.h,),
                        ],
                      )
                      // DropdownButton(
                      //   isExpanded: true,
                      //   value: dropdownvalue,
                      //   underline: Container(),
                      //   items: items.map((String items) {
                      //     return DropdownMenuItem(
                      //       value: items,
                      //       child: Text(items,style: TextStyle(color: Colors.black54,fontSize: 11.sp),),
                      //     );
                      //   }).toList(),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       dropdownvalue = newValue!;
                      //     });
                      //   },
                      //   hint: const Text(
                      //     "Font Family",
                      //     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                      //   ),
                      // ),
                    ),
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Create Domain *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  Container(
                    height: 4.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey,width: 1)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 63.w,
                          height: 4.5.h,
                          child: TextField(
                            style: TextStyle(fontSize: 12.sp),
                            textAlign: TextAlign.right,
                            controller: provider.domainController,
                           // obscureText: widget.obsecureText !=null ? widget.obsecureText! : false,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(0),borderSide: BorderSide.none),
                              hintText: 'business name',
                              //labelText: 'Keyword',
                              //labelStyle: TextStyle(fontSize: 10.sp,color: Colors.grey),
                              hintStyle: TextStyle(fontSize: 11.sp,color: Colors.grey),
                              contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 2.w),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                          children: [
                            Container(
                              height: 4.5.h,
                              width: 0.4.w,
                              color: Colors.grey,
                            ),
                            SizedBox(width:3.w),
                            Text(
                              '.dialboxx.com',
                              style: TextStyle(fontSize: 11.sp,color: Colors.black.withAlpha(200)),
                            )
                          ],
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.2.h,),
                  Row(
                    children: [
                      Text(
                        'Password *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextField(
                    obsecureText: true,
                    hintText: 'Enter Password',
                    controller: provider.passwordController,
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Text(
                        'Confirm Password *',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  CustomTextField(
                    obsecureText: true,
                    hintText: 'Enter Confirm Password',
                    controller: provider.cPasswordController,
                  ),
                  SizedBox(height: 1.h,),
                  GestureDetector(
                    onTap: () {
                      provider.checkboxSelected = true;
                      setState(() {

                      });
                    },
                    child: Row(
                      children: [
                        if(provider.checkboxSelected == true)
                          SvgPicture.asset('assets/svgs/tickss.svg',height: 2.5.h,),
                        if(provider.checkboxSelected == false)
                        SvgPicture.asset('assets/svgs/empty_checkbox.svg',height: 2.5.h,),
                        SizedBox(width: 2.w,),
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'I agree with the  ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp
                                      )
                                  ),
                                  TextSpan(
                                      text: 'term ' ,
                                      style: TextStyle(
                                          color: blueColor,
                                          fontSize: 12.sp,
                                          //fontWeight: FontWeight.bold
                                      )
                                  ),
                                  TextSpan(
                                      text: 'and ' ,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          //fontWeight: FontWeight.bold
                                      )
                                  ),
                                  TextSpan(
                                      text: 'conditions' ,
                                      style: TextStyle(
                                          color: blueColor,
                                          fontSize: 12.sp,
                                          //fontWeight: FontWeight.bold
                                      )
                                  )
                                ]
                            )
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  GestureDetector(
                    onTap: () {
                      // if(provider.passwordController.text != provider.cPasswordController.text){
                      //   Get.snackbar('Alert!', 'Password must be same');
                      // }
                      // else{
                         provider.sign_up_api(context);
                      // }
                      // if(list.isNotEmpty)
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: blueColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 0.7.h,horizontal: 14.w),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.2.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkboxContainer({String? text}) {
    return Column(
      children: [
        Container(
          color: Colors.blue.withAlpha(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/empty_circle.svg',height: 1.6.h,),
                    SizedBox(width: 2.w,),
                    Container(
                      width: 65.w,
                      child: Text(
                        text!,
                        style: TextStyle(
                            color: Color(0xff727272),
                            fontSize: 10.sp,
                            height: 0.16.h
                        ),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset('assets/svgs/$text.svg',height: 5.h,),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }

  Widget selected_checkboxContainer({String? text}) {
    return Column(
      children: [
        Container(
          color: Colors.blue.withAlpha(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: 1),
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(1.2),
                          child: SvgPicture.asset('assets/svgs/fill_circle.svg',height: 1.3.h,),
                        )),
                    SizedBox(width: 2.w,),
                    Container(
                      width: 65.w,
                      child: Text(
                        text!,
                        style: TextStyle(
                            color: Color(0xff727272),
                            fontSize: 10.sp,
                            height: 0.16.h
                        ),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset('assets/svgs/$text.svg',height: 5.h,),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        )
      ],
    );
  }

}
