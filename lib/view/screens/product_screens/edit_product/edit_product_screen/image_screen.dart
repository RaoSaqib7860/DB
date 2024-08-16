import 'package:db_2_0/api_repository/api_utils.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:db_2_0/view/screens/auth_screens/login_screen/Login%20Provider/login_model_globle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../../custom_widgets/app_colors.dart';
import '../../../../../custom_widgets/custom_toast.dart';
import '../../Provider/add_product_provider.dart';

class ImageScreen extends StatefulWidget {
  final int? index;
  final String? productId;
  const ImageScreen({this.index, Key? key, this.productId}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  void initState() {
    api_call();
    super.initState();
  }

  api_call() async {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context, listen: false);
    provider.profileImage = [];
    provider.updateProductImageModel = null;
    setState(() {});
    await provider.update_Image_product_data(productId: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final AddProductProvider provider =
        Provider.of<AddProductProvider>(context);
    return DataLoading(
      isLoading: provider.image_loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: provider.updateProductImageModel == null
              ? SizedBox()
              : Container(
                  height: 100.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 10.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              InkWell(
                                onTap: () {
                                  provider.upload_Image();
                                },
                                child: Container(
                                  height: 10.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withAlpha(50),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Center(
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.blue,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemCount: provider.updateProductImageModel!
                                    .data!.medias!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          height: 10.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade100,
                                                    spreadRadius: 1,
                                                    offset: Offset(1, 1)),
                                                BoxShadow(
                                                    color: Colors.grey.shade100,
                                                    spreadRadius: 1,
                                                    offset: Offset(-1, -1)),
                                              ]),
                                          child: Image.network(
                                              fit: BoxFit.cover,
                                              'https:${provider.updateProductImageModel!.data!.medias![index].url}'),
                                        ),
                                      ),
                                      Positioned(
                                          right: 2.w,
                                          top: 2.w,
                                          child: InkWell(
                                            onTap: () {
                                              DataProvider()
                                                  .remove_images_productApi(
                                                      map: {
                                                    'user_id':
                                                        '${user_model.data!.id}',
                                                    'media_id':
                                                        '${provider.updateProductImageModel!.data!.medias![index].id}'
                                                  });
                                              provider.updateProductImageModel!
                                                  .data!.medias!
                                                  .removeAt(index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 2.h,
                                              width: 5.w,
                                              color: Colors.white,
                                              child: Center(
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                ),
                                              ),
                                            ),
                                          ))
                                    ],
                                  );
                                },
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Wrap(
                          children: provider.profileImage.map((e) {
                            return Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withAlpha(50),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade100,
                                              spreadRadius: 1,
                                              offset: Offset(1, 1)),
                                          BoxShadow(
                                              color: Colors.grey.shade100,
                                              spreadRadius: 1,
                                              offset: Offset(-1, -1)),
                                        ]),
                                    child: Image.file(
                                      e,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 2.w,
                                    top: 2.w,
                                    child: Container(
                                      height: 2.h,
                                      width: 5.w,
                                      color: Colors.white,
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          size: 15,
                                        ),
                                      ),
                                    ))
                              ],
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Add Product Image (upto 7)',
                          style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await provider.update_Image_product_data(
                                    productId: widget.productId, update: true);
                                api_call();
                                CustomToastManager.showToast(
                                    context: context,
                                    height: 8.h,
                                    width: 60.w,
                                    message: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/svgs/pro_toast.svg',
                                              height: 3.h,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Changes saved\nsuccessfully',
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  color: Colors.black,
                                                  height: 0.16.h,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: redColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.7.w, vertical: 0.8.h),
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 0.8.h),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
