import 'package:flutter/cupertino.dart';
import 'package:mirror_wall_app/screen/home/view/home_screen.dart';
import 'package:mirror_wall_app/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
};
