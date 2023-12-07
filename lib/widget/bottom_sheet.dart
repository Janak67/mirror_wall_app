import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/home/provider/home_provider.dart';

void bookModelBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.sizeOf(context).height * 0.95,
        color: Colors.white,
        child: ListView.builder(
          itemCount: context.read<HomeProvider>().bookMarkData!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  "https://www.google.com/search?q ${context.read<HomeProvider>().bookMarkData!}"),
            );
          },
        ),
      );
    },
  );
}
