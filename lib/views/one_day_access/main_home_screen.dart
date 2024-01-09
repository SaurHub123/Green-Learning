import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final MainApplicationController _mainApplicationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _mainApplicationController
          .bottomPages[_mainApplicationController.bottomNavIdx.value]),
      bottomNavigationBar: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
        child: GNav(
          onTabChange: (value) {
            _mainApplicationController.bottomNavIdx.value = value;
          },
          tabBorder: null,
          haptic: true,
          activeColor: Colors.white,
          tabBackgroundColor: Constants.primaryColor,
          rippleColor: Colors.white,
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
          tabs: [
            _bottomIcons(
                MaterialCommunityIcons.view_dashboard_outline, "Dashboard"),
            _bottomIcons(SimpleLineIcons.book_open, "Courses"),
            _bottomIcons(MaterialIcons.event, "Events"),
            _bottomIcons(MaterialCommunityIcons.account_tie, "Account"),
          ],
        ),
      ),
    );
  }

  GButton _bottomIcons(IconData iconData, String title) {
    return GButton(
      gap: 10,
      icon: iconData,
      text: title,
      iconSize: 20.sp,
      textStyle: GoogleFonts.rajdhani(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
