import 'package:flutter/material.dart';

void bookModelBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.sizeOf(context).height * 0.95,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: ListView.builder(
                  itemBuilder: (context, index) {},
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
