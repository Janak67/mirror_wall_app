import 'package:flutter/material.dart';
import 'package:mirror_wall_app/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  bool isOnline = false;
  List<String>? bookMarkData = [];

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookmarkData();
    notifyListeners();
  }
}
