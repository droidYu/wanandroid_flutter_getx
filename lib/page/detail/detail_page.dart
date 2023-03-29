import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/net/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.article}) : super(key: key);
  final Article article;
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(article.title ?? ''),
      ),
      body: WebViewWidget(
          controller: controller..loadRequest(Uri.parse(article.link ?? ''))),
    );
  }
}
