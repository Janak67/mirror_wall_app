import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void showWebDialog(BuildContext context) {
  InAppWebViewController? inAppWebViewController;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(
          child: Text('Search Engine'),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Google'),
              value: 'https://www.google.com/',
              groupValue: 1,
              onChanged: (value) {},
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
              value: 'https://in.yahoo.com',
              groupValue: 1,
              title: const Text('Yahoo'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'https://www.bing.com/',
              groupValue: 1,
              title: const Text('Bing'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 'https://duckduckgo.com',
              groupValue: 1,
              title: const Text('Duck Duck Go'),
              onChanged: (value) {},
            ),
          ],
        ),
      );
    },
  );
}
