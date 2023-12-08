import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/home/provider/home_provider.dart';

void bookModelBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView.builder(
        itemCount: context.read<HomeProvider>().bookMarkData!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(context.read<HomeProvider>().bookMarkData![index]),
            trailing: IconButton(
              onPressed: () {
                context.read<HomeProvider>().deleteBookMark();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
      );
    },
  );
}
