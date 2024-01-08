import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/services/global.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/auth/auth_selection_screen.dart';
import 'package:green_learning/views/common/about_us_screen.dart';
import 'package:green_learning/views/common/account/profile_screen.dart';
import 'package:green_learning/views/common/contact_screen.dart';
import 'package:green_learning/views/common/privacy_policy_screen.dart';
import 'package:green_learning/views/common/upgrade_account_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'one_day_access/dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(
    //   const Duration(seconds: 2),
    //   () => Get.offAll(() => const AuthSelectionScreen()),
    // );
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

      if (hoursDifference > 24) {
        // User access is restricted
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const UpgradeAccountScreen()),
        );
      } else {
        // User access is allowed, navigate to the DashboardScreen
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const ProfileScreen()),
        );
      }
    }
    else{
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
