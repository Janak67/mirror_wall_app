import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../screen/home/view/home_screen.dart';

void showWebDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final searchProvider = context.read<HomeProvider>();
      return AlertDialog(
        title: const Center(
          child: Text('Search Engine'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Google'),
              value: 'Google',
              groupValue: searchProvider.martialLink,
              onChanged: (value) {
                searchProvider.setmartialStatus(value.toString());
                HomeScreenState.inAppWebViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse('https://www.google.com/'),
                  ),
                );
                Navigator.pop(context);
              },
              // context.read<HomeProvider>().p1.PopMenuItemURI,
              // onChanged: (value) {
              //   context.read<HomeProvider>().getValueURI(value);
              //   inAppWebViewController!.loadUrl(
              //     urlRequest: URLRequest(
              //       url: Uri.parse(
              //           context.read<HomeProvider>().p1.PopMenuItemURI),
              //     ),
              //   );
              //   Navigator.pop(context);
              // },
            ),
            RadioListTile(
              value: 'Yahoo',
              groupValue: searchProvider.martialLink,
              title: const Text('Yahoo'),
              onChanged: (value) {
                searchProvider.setmartialStatus(value.toString());
                HomeScreenState.inAppWebViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse('https://in.yahoo.com'),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            RadioListTile(
              value: 'Bing',
              groupValue: searchProvider.martialLink,
              title: const Text('Bing'),
              onChanged: (value) {
                searchProvider.setmartialStatus(value.toString());
                HomeScreenState.inAppWebViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse('https://www.bing.com/'),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            RadioListTile(
              value: 'Duck Duck Go',
              groupValue: searchProvider.martialLink,
              title: const Text('Duck Duck Go'),
              onChanged: (value) {
                searchProvider.setmartialStatus(value.toString());
                HomeScreenState.inAppWebViewController!.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse('https://duckduckgo.com'),
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
