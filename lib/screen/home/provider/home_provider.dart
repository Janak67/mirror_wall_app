import 'package:flutter/material.dart';
import 'package:mirror_wall_app/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  bool isOnline = false;
  bool isDataSave = false;
  List<String> Bookmark = [];

  // PopMenuItemSelect_Model p1 =
  //     PopMenuItemSelect_Model(PopMenuItemSelect: '1', PopMenuItemURI: '');
  //
  // getValueSelect(val) {
  //   p1.PopMenuItemSelect = val;
  //   notifyListeners();
  // }
  //
  // getValueURI(val) {
  //   p1.PopMenuItemURI = val;
  //   notifyListeners();
  // }

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  void saveData() async {
    ShareHelper shr = ShareHelper();
    bool? isSave = await shr.getBookmarkData();
    isDataSave = isSave ?? true;
    notifyListeners();
  }
}
