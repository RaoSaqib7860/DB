import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/app_colors.dart';
import '../../../../custom_widgets/custom_line_textfield.dart';
import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import '../Provider/all_product_provider.dart';
import '../product_screen.dart';

class CreateCategoryScreen extends StatefulWidget {
  String? name;
  String? type;
  String? pId;
  int? featudeId;
  int? menuId;
  int? topHeaderId;
  String? url;

  CreateCategoryScreen(
      {Key? key,
      this.name,
      this.url,
      this.featudeId,
      this.menuId,
      this.pId,
        this.type,
      this.topHeaderId})
      : super(key: key);

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  bool _value = false;
  var featuredList = [
    'No',
    'Yes',
  ];
  var assignList = [
    'No',
    'Yes',
  ];
  var assignToHeaderList = [
    'No',
    'Yes',
  ];
  int? id;
  File? logoImage;
  ImagePicker pickerLogo = ImagePicker();

  Future upload_Image() async {
    final XFile? result =
        await pickerLogo.pickImage(source: ImageSource.gallery);
    if (result != null) {
      logoImage = File(result.path);
      setState(() {});
    }
  }

  TextEditingController nameController = TextEditingController();
  String? selectCategories;

  dynamic selectFeatured;

  int? selectFeaturedIndex;

  dynamic selectAssign;

  int? selectAssignIndex;

  dynamic selectAssignToHeader;

  int? selectAssignToHeaderIndex;

  @override
  void initState() {
    api_call();
    super.initState();
  }

  api_call() {
    if (widget.type == '1') {
      final AllProductProvider provider =
          Provider.of<AllProductProvider>(context, listen: false);
      provider.get_categories(map: {'user_id': '${user_model.data!.userId}'});
      nameController.text = widget.name ?? '';
      if(widget.featudeId == 0){
        selectFeatured = 'No';
      }else{
        selectFeatured = 'Yes';
      }
      setState(() {});
    } else {
      final AllProductProvider provider =
          Provider.of<AllProductProvider>(context, listen: false);
      provider.get_categories(map: {'user_id': '${user_model.data!.userId}'});
    }
  }

  @override
  Widget build(BuildContext context) {
    final AllProductProvider provider =
        Provider.of<AllProductProvider>(context);
    return Scaffold(
      body: DataLoading(
        isLoading: provider.upload_category_loading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 7.h,
                width: 100.w,
                color: blueColor,
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 4.h,
                            width: 10.w,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svgs/back_arrow.svg',
                                height: 3.h,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Product Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLineTextField(
                      name: 'Name',
                      hint: 'Cabnet',
                      controller: nameController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Text(
                        'Parent Category',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ),
                    if (provider.cateoryProductModel?.data?.categories != null)
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Container(
                          height: 4.h,
                          child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff4C4C4C),
                              size: 3.h,
                            ),
                            underline: Container(
                              color: Colors.grey,
                              height: 0.10.h,
                              width: 100.w,
                            ),
                            value: selectCategories,
                            items: provider
                                .cateoryProductModel?.data?.categories!
                                .map((e) {
                              return DropdownMenuItem(
                                value: e.name,
                                child: Text(
                                  '${e.name}',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Color(0xff8E8E8E)),
                                ),
                              );
                            }).toList(),
                            onChanged: (dynamic newValue) {
                              setState(() {
                                selectCategories = newValue;
                                int? index = provider
                                    .cateoryProductModel?.data?.categories!
                                    .indexWhere((element) =>
                                        element.name == selectCategories);
                                id = provider.cateoryProductModel?.data
                                    ?.categories![index!].id;
                              });
                            },
                            hint: Text(
                              "None",
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      ),
                    if(widget.pId != null)
                    Wrap(
                      children: provider.cateoryProductModel!.data!.categories![0].children!.map((e) {
                        return Chip(label: Text('${e.name}'),onDeleted: (){},);
                      }).toList(),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Text(
                        'Featured',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Container(
                        height: 4.h,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff4C4C4C),
                            size: 3.h,
                          ),
                          underline: Container(
                            color: Colors.grey,
                            height: 0.10.h,
                            width: 100.w,
                          ),
                          value: selectFeatured,
                          items: featuredList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Color(0xff8E8E8E)),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              selectFeatured = newValue!;
                              selectFeaturedIndex =
                                  featuredList.indexOf(newValue);
                            });
                          },
                          hint: Text(
                            "None",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Text(
                        'Assign To Menu',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Container(
                        height: 4.h,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff4C4C4C),
                            size: 3.h,
                          ),
                          underline: Container(
                            color: Colors.grey,
                            height: 0.10.h,
                            width: 100.w,
                          ),
                          value: selectAssign,
                          items: assignList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Color(0xff8E8E8E)),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              selectAssign = newValue!;
                              selectAssignIndex = assignList.indexOf(newValue);
                            });
                          },
                          hint: Text(
                            "None",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Text(
                        'Assign Top Header Menu',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Container(
                        height: 4.h,
                        child: DropdownButton(
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff4C4C4C),
                            size: 3.h,
                          ),
                          underline: Container(
                            color: Colors.grey,
                            height: 0.10.h,
                            width: 100.w,
                          ),
                          value: selectAssignToHeader,
                          items: assignToHeaderList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Color(0xff8E8E8E)),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              selectAssignToHeader = newValue!;
                              selectAssignToHeaderIndex =
                                  assignToHeaderList.indexOf(newValue);
                            });
                          },
                          hint: Text(
                            "None",
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Text(
                        'Thumbnail',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: InkWell(
                        onTap: () async {
                          await upload_Image();
                        },
                        child: Container(
                          height: 3.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            border: Border.all(
                                width: 0.7, color: Color(0xff4C4C4C)),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              'Choose File',
                              style: TextStyle(
                                  color: Color(0xff4C4C4C), fontSize: 8.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Divider(
                        thickness: 0.8,
                        color: Colors.black,
                      ),
                    ),
                    if (logoImage != null)
                      Container(
                        height: 10.h,
                        width: 20.w,
                        child: Center(
                          child:
                          Image.file(logoImage!),
                        ),
                      ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Map<String, dynamic> map = {
                          'user_id': '${user_model.data!.userId}',
                          'action': 'add',
                          'name': '${nameController.text}',
                          'featured': '$selectFeaturedIndex',
                          'menu_status': '$selectAssignIndex',
                          'top_menu': '$selectAssignToHeaderIndex',
                          'p_id': id,
                          'domain_id': '${user_model.data!.domainId}',
                          'file': await MultipartFile.fromFile(
                            logoImage!.path,
                          ),
                        };
                        map.removeWhere((key, value) => value == null);
                        await provider.upload_categories(
                            uploadMedia: dio.FormData.fromMap(map));
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
