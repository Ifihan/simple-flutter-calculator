import 'package:flutter/material.dart';
import 'package:simple_mia_calc/features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mia Calc',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
