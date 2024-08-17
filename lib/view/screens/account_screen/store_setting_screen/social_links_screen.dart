import 'package:db_2_0/custom_widgets/app_colors.dart';
import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../auth_screens/login_screen/Login Provider/login_model_globle.dart';
import 'Provider/get_store_info_provider.dart';

class SocialLinksScreen extends StatefulWidget {
  const SocialLinksScreen({Key? key}) : super(key: key);

  @override
  State<SocialLinksScreen> createState() => _SocialLinksScreenState();
}

class _SocialLinksScreenState extends State<SocialLinksScreen> {
  @override
  void initState() {
    getDataStore();
    super.initState();
  }
  getDataStore() async {
    final GetAndUpdateStoreProvider provider =
    Provider.of<GetAndUpdateStoreProvider>(context, listen: false);
    await provider.getAndUpdateSocialLink(map: {
      'user_id': '${user_model.data!.userId}',
      'domain_id': '${user_model.data!.domainId}'
    });
    provider.fbController.text = provider.getSocialLinkModel?.data?.socialtype?.facebook ?? '';
    provider.instagramController.text = provider.getSocialLinkModel?.data?.socialtype?.instagram ?? '';
    provider.ytController.text = provider.getSocialLinkModel?.data?.socialtype?.youtube ?? '';
    provider.twitterController.text = provider.getSocialLinkModel?.data?.socialtype?.twitter ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final GetAndUpdateStoreProvider provider =
    Provider.of<GetAndUpdateStoreProvider>(context);
    return DataLoading(
      isLoading: provider.loadingSocial!,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 6.w),
          child:provider.getSocialLinkModel == null? SizedBox(): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Social Links',
                style: TextStyle(
                    color: blueColor,
                    fontSize: 12.sp
                ),
              ),
              SizedBox(height: 2.h,),
              customLinkContainer(image: 'fb', text: 'www.facebook.com/', controller: provider.fbController),
              customLinkContainer(image: 'insta', text: 'www.instagram.com/', controller: provider.instagramController),
              customLinkContainer(image: 'youtubee', text: 'www.youtube.com/', controller: provider.ytController),
              customLinkContainer(image: 'twitter', text: 'www.twitter.com/', controller: provider.twitterController),
              SizedBox(height: 27.h,),
              InkWell(
                onTap: () async{
                  await provider.getAndUpdateSocialLink(map: {
                    'user_id': '${user_model.data!.userId}',
                    'domain_id': '${user_model.data!.domainId}',
                    'facebook': '${provider.fbController.text}',
                    'instagram': '${provider.instagramController.text}',
                    'youtube': '${provider.ytController.text}',
                    'twitter': '${provider.twitterController.text}',
                    'update': '1',
                  });
                },
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customLinkContainer({String? image,String? text,TextEditingController? controller}){
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/svgs/$image.svg',height: 3.h,),
            SizedBox(width: 2.w,),
            Text(
              text!,
              style: TextStyle(
                  color: Color(0xff313131),
                  fontSize: 12.sp
              ),
            ),
            SizedBox(width: 2.w,),
            Expanded(
                child: Container(
                  height: 3.5.h,
                  child: TextField(
                    controller: controller,
                    style: TextStyle(fontSize: 12.sp),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(color: Colors.black,width: 1)),
                      hintText: 'Type here',
                      hintStyle: TextStyle(fontSize: 10.sp,color: Colors.black),
                      contentPadding: EdgeInsets.only(top: 0.5.h,left: 2.w,right: 1.w),
                    ),
                  ),
                )
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }

}
