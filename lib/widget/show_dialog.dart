import 'package:flutter/material.dart';

void showWebDialog(BuildContext context) {
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
              value: 1,
              groupValue: 1,
              title: const Text('Google'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 1,
              groupValue: 1,
              title: const Text('Yahoo'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 1,
              groupValue: 1,
              title: const Text('Bing'),
              onChanged: (value) {},
            ),
            RadioListTile(
              value: 1,
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
