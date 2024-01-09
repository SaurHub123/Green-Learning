import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/services/global.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/auth/auth_selection_screen.dart';
import 'package:green_learning/views/common/upgrade_account_screen.dart';
import 'package:green_learning/views/one_day_access/main_home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkApplicationState();
    super.initState();
  }

  checkApplicationState() {
    String? cacheStringTimestamp =
        Global.storageServices.getString(Constants.loginTimestamp);
    if (cacheStringTimestamp != null) {
      DateTime currentTimestamp = DateTime.now();
      DateTime cacheTimestamp = DateTime.parse(cacheStringTimestamp);
      int hoursDifference = currentTimestamp.difference(cacheTimestamp).inHours;

      String? accessTime =
          Global.storageServices.getString(Constants.accessTime);

      if (accessTime == Constants.limitedDayAccess && hoursDifference > 360) {
        // Upgrade account to unlimited access
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const UpgradeAccountScreen()),
        );
      } else if (accessTime == Constants.oneDayAccess && hoursDifference > 24) {
        // Upgrade account to limited access
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const UpgradeAccountScreen()),
        );
      } else {
        // User access is allowed, navigate to the DashboardScreen
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const MainHomeScreen()),
        );
      }
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Get.offAll(() => const AuthSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Text(
            "Reclaim India",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
