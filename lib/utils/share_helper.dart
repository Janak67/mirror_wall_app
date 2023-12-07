import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  Future<void> setBookmarkData(List<String> bookMarkData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('Url', bookMarkData);
  }

  Future<List<String>?> getBookmarkData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList('Url');
  }
}
