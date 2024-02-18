import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailViewScreen extends StatefulWidget {
  String newsUrl;
   DetailViewScreen( {super.key,required this.newsUrl});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
    WebViewController controller=WebViewController();

  @override
  Widget build(BuildContext context) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.cyan)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {
            const Center(child: CircularProgressIndicator(strokeWidth: 5,color: Colors.black,value: 20,));

          },
          onPageFinished: (String url) {

          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {

            if (request.url.startsWith(widget.newsUrl)) {

              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.newsUrl));
    return Scaffold(
      body:WebViewWidget(controller: controller)
    );
  }
}
