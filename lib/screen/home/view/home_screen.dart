import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/screen/home/provider/home_provider.dart';
import 'package:mirror_wall_app/utils/network.dart';
import 'package:mirror_wall_app/widget/bottom_sheet.dart';
import 'package:mirror_wall_app/widget/show_dialog.dart';
import 'package:provider/provider.dart';
import '../../../utils/share_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  static InAppWebViewController? inAppWebViewController;
  TextEditingController txtSearch = TextEditingController();
  NetworkConnection networkConnection = NetworkConnection();
  HomeProvider? providerr;
  HomeProvider? providerw;
  static PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Colors.blue),
      onRefresh: () async {
        await inAppWebViewController?.reload();
      },
    );
    networkConnection.checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Browser'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        bookModelBottomSheet(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(width: 10),
                          Text('All Bookmarks'),
                        ],
                      ),
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
        body: providerw!.isOnline
            ? Stack(
                children: [
                  InAppWebView(
                    pullToRefreshController: pullToRefreshController,
                    initialUrlRequest: URLRequest(
                      url: Uri.parse('https://www.google.com/'),
                    ),
                    onLoadStart: (controller, url) =>
                        inAppWebViewController = controller,
                    onLoadStop: (controller, url) =>
                        inAppWebViewController = controller,
                    onProgressChanged: (controller, progress) {
                      inAppWebViewController = controller;
                      providerw!.progressStatus(progress);
                      if (progress == 100) {
                        pullToRefreshController?.endRefreshing();
                      }
                      // providerr!.pullToRefresh(progress);
                    },
                    onLoadError: (controller, url, code, message) =>
                        inAppWebViewController = controller,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.16,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: txtSearch,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Search or type web address',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        inAppWebViewController?.loadUrl(
                                          urlRequest: URLRequest(
                                            url: Uri.parse(
                                                'https://www.google.com/search?q=${txtSearch.text}'),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.search))),
                            ),
                          ),
                          LinearProgressIndicator(
                            color: const Color(0xff6054c1),
                            value: providerr!.progressValue,
                            backgroundColor: Colors.indigo.shade100,
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
                                onPressed: () async {
                                  String uri =
                                      (await inAppWebViewController!.getUrl())
                                          .toString();
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<HomeProvider>()
                                      .bookMarkData!
                                      .add(uri);
                                  ShareHelper shareHelper = ShareHelper();
                                  // ignore: use_build_context_synchronously
                                  await shareHelper.setBookmarkData(context
                                      .read<HomeProvider>()
                                      .bookMarkData!);
                                  // ignore: use_build_context_synchronously
                                  context.read<HomeProvider>().getBookMark();
                                },
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
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/img/no-Internet.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'please check Internet Connection',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
