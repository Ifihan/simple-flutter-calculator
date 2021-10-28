import 'dart:async';

import 'package:simple_mia_calc/features/calc_screen/calc_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const CalcApp(),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: const Image(
                image:  AssetImage('assets/images/calc.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  screenAwareSize(dynamic i, BuildContext context) {}
}