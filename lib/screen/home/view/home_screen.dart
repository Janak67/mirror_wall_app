import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/widget/show_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MY Browser'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.bookmark),
                        SizedBox(width: 10),
                        Text('All Bookmarks'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        showWebDialog(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.screen_search_desktop_outlined),
                          SizedBox(width: 10),
                          Text('Search Engine'),
                        ],
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://www.google.com/'),
              ),
              onLoadStart: (controller, url) =>
                  inAppWebViewController = controller,
              onLoadStop: (controller, url) =>
                  inAppWebViewController = controller,
              onProgressChanged: (controller, progress) =>
                  inAppWebViewController = controller,
              onLoadError: (controller, url, code, message) =>
                  inAppWebViewController = controller,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.16,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search or type web address',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.loadUrl(
                              urlRequest: URLRequest(
                                url: Uri.parse(
                                  'https://www.google.com/',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.home_outlined,
                              color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_outlined,
                              color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.goBack();
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined,
                              color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.reload();
                          },
                          icon: const Icon(Icons.refresh_outlined,
                              color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            inAppWebViewController!.goForward();
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
