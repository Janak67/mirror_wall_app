import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  Future<void> setBookmarkData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('bookmark', true);
  }

  Future<bool?> getBookmarkData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? data = await shr.getBool('bookmark');
    return data;
  }
}
