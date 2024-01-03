import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_learning/views/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:green_learning/services/global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, type) {
      return GetMaterialApp(
        title: 'Green Learning',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
