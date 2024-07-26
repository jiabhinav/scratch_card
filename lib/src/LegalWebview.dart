import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class LegalWebview extends  StatefulWidget {
        const LegalWebview({Key? key}) : super(key: key);
        @override
        State<LegalWebview> createState() => _WebViewScreenState();
        }
        class _WebViewScreenState extends State<LegalWebview> {
          var data = Get.arguments;
          final controller=WebViewController();
        bool _loading = true;

        @override
        void initState() {
        super.initState();
        print(data[1]['url']);
        controller
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {
                setState(() {
                  _loading=false;
                });
              },
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith(data[1]['url'])) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(data[1]['url']));
        }
        @override
        Widget build(BuildContext context)
        {
        return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title:  Text(data[0]['name']),
        ),
        body: Stack(children: [
        WebViewWidget(controller: controller),
        if (_loading) const Center(child: CircularProgressIndicator())
        ],
        ));
        }
        }