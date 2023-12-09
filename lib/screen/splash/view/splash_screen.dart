import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/google.png',
                height: 45,
              ),
              Image.asset(
                'assets/img/yahoo.png',
                height: 45,
              ),
              Image.asset(
                'assets/img/bing.png',
                height: 45,
              ),
              Image.asset(
                'assets/img/duckduckgo.png',
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
