import 'package:flutter/material.dart';
import 'package:mirror_wall_app/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  bool isOnline = false;
  List<String>? bookMarkData = [];
  String martialLink = 'Google';
  double progressValue = 0;
  int? infoIndex;

  // PullToRefreshController? pullToRefreshController;

  String get martialStatus => martialLink;

  void progressStatus(progress) {
    progressValue = progress / 100;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookmarkData();
    notifyListeners();
  }

  void setmartialStatus(String value) {
    martialLink = value;
    notifyListeners();
  }

  void deleteBookMark() {
    bookMarkData!.removeAt(infoIndex!);
    notifyListeners();
  }

  // void pullToRefresh(progress) {
  //   if (progress == 100) {
  //     pullToRefreshController?.endRefreshing();
  //   }
  //   notifyListeners();
  // }
}
