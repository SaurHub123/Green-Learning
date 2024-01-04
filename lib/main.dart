import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_learning/controllers/auth_controller.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/views/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:green_learning/services/global.dart';

void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MainApplicationController mainApplicationController =
      Get.put(MainApplicationController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, type) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
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
