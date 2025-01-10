import 'package:db_2_0/custom_widgets/data_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebView extends StatefulWidget {
  final String? url;
  final bool? appbar;
  const WebView({super.key, this.url, this.appbar = true});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _controller;
  bool load = true;
  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            load = false;
            setState(() {});
          },
        ),
      )
      ..loadRequest(Uri.parse('${widget.url}'));
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return DataLoading(
      isLoading: load,
      child: Scaffold(
        appBar:  AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title:widget.appbar == false
                    ? null
                    : Hero(
                  tag: 'app_logo',
                  child: Image(
                    image: AssetImage('assets/images/app_logo.png'),
                    height: 4.h,
                  ),
                ),
                centerTitle: true,
                automaticallyImplyLeading: true,
                // actions: [
                //   Padding(
                //     padding: EdgeInsets.only(right: 4.w),
                //     child: GestureDetector(
                //         onTap: () {},
                //         child: SvgPicture.asset(
                //           'assets/svgs/noti.svg',
                //           height: 3.h,
                //         )),
                //   ),
                // ],
                leadingWidth: 20.w,
                // leading: Padding(
                //   padding: EdgeInsets.only(left: 4.w),
                //   child: DropdownButton(
                //     isExpanded: true,
                //     value: dropdownvalue,
                //     icon: Icon(
                //       Icons.keyboard_arrow_down,
                //       color: Colors.black,
                //       size: 2.h,
                //     ),
                //     underline: Container(),
                //     items: items.map((String items) {
                //       return DropdownMenuItem(
                //         value: items,
                //         child: Text(
                //           items,
                //           style: TextStyle(color: Colors.black54),
                //         ),
                //       );
                //     }).toList(),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropdownvalue = newValue!;
                //       });
                //     },
                //   ),
                // )
              ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
