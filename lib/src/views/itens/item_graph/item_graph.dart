import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ItemGraph extends StatefulWidget {
  const ItemGraph({super.key});

  @override
  State<ItemGraph> createState() => _ItemGraphState();
}

class _ItemGraphState extends State<ItemGraph> {
  final String itemID = Get.arguments;
  final getData = GetData();
  bool _isLoading = false;
  String cookie = "";

  Future<void> fetchCookies() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    cookie = await getData.getCookie();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> setLoginCookies(String url) async {
    final WebViewCookieManager cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();
  }

  @override
  void initState() {
    super.initState();
    fetchCookies();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    String itemID = Get.arguments;

    String url =
        'http://177.129.127.1:65002/chart.php?from=now-2d&to=now&itemids%5B0%5D=$itemID&type=0&width=1082&height=200&profileIdx=web.item.graph.filter';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: _isLoading
          ? const Text('Carregando...')
          : FutureBuilder<void>(
              future: setLoginCookies(url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(const Color(0x00000000))
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {
                              // Update loading bar.
                            },
                            onPageStarted: (String url) {},
                            onPageFinished: (String url) {},
                            onWebResourceError: (WebResourceError error) {},
                            onNavigationRequest: (NavigationRequest request) {
                              return NavigationDecision.navigate;
                            },
                          ),
                        )
                        ..loadRequest(Uri.parse(url),
                            headers: {"cookie": cookie}));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }
}
