import 'package:flutter/material.dart';
import 'package:mirror_wall_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().getBookMark();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 3),
    //       () {
    //     Navigator.pushReplacementNamed(context, 'home');
    //   },
    // );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: const Alignment(-0.25, 0),
              child: Image.asset(
                'assets/img/google.png',
                height: 45,
              ),
            ),
            Align(
              alignment: const Alignment(-0.1, 0),
              child: Image.asset(
                'assets/img/yahoo.png',
                height: 45,
              ),
            ),
            Align(
              alignment: const Alignment(0.1, 0),
              child: Image.asset(
                'assets/img/bing.png',
                height: 45,
              ),
            ),
            Align(
              alignment: const Alignment(0.25, 0),
              child: Image.asset(
                'assets/img/duckduckgo.png',
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
