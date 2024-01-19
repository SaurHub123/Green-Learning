import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      body: Obx(() => _mainApplicationController
          .bottomPages[_mainApplicationController.bottomNavIdx.value]),
      bottomNavigationBar: Container(
        width: 100.w,
        color: Colors.transparent,
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
        child: Container(
          width: 80.w,
          decoration: BoxDecoration(
            color: const Color(0xFFfafafa),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Row(
            children: [
              _bottomIcons(
                MaterialCommunityIcons.view_dashboard_outline,
                MaterialCommunityIcons.view_dashboard_variant,
                "Dashboard",
                0,
              ),
              _bottomIcons(
                MaterialCommunityIcons.book_open_outline,
                MaterialCommunityIcons.book_open_page_variant,
                "Courses",
                1,
              ),
              _bottomIcons(
                Icons.emoji_events_outlined,
                Icons.emoji_events,
                "Events",
                2,
              ),
              _bottomIcons(
                MaterialCommunityIcons.account_outline,
                MaterialCommunityIcons.account_tie,
                "Account",
                3,
              ),
            ],
          ),
        ),
        // child:
        // GNav(
        //   onTabChange: (value) {
        //     _mainApplicationController.bottomNavIdx.value = value;
        //   },
        //   tabBorder: null,
        //   haptic: true,
        //   activeColor: Colors.white,
        //   tabBackgroundColor: Constants.primaryColor,
        //   rippleColor: Colors.white,
        //   curve: Curves.easeOutExpo,
        //   duration: const Duration(milliseconds: 100),
        //   padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
        //   tabs: [
        //     _bottomIcons(
        //         MaterialCommunityIcons.view_dashboard_outline, "Dashboard"),
        //     _bottomIcons(SimpleLineIcons.book_open, "Courses"),
        //     _bottomIcons(MaterialIcons.event, "Events"),
        //     _bottomIcons(MaterialCommunityIcons.account_tie, "Account"),
        //   ],
        // ),
      ),
    );
  }

  // GButton _bottomIcons(IconData iconData, String title) {
  //   return GButton(
  //     gap: 10,
  //     icon: iconData,
  //     text: title,
  //     iconSize: 20.sp,
  //     textStyle: GoogleFonts.rajdhani(
  //       fontSize: 14.sp,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //     ),
  //   );
  // }
  Widget _bottomIcons(
      IconData iconData, IconData filledIconData, String title, int index) {
    return Expanded(
      child: Obx(() {
        return InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            _mainApplicationController.bottomNavIdx.value = index;
          },
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              _mainApplicationController.bottomNavIdx.value == index
                  ? Positioned(
                      top: -18.sp,
                      child: Container(
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.w),
                        ),
                        child: Center(
                          child: Text(
                            title,
                            style: GoogleFonts.rajdhani(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Constants.darkGreenVariantColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              Icon(
                  index == _mainApplicationController.bottomNavIdx.value
                      ? filledIconData
                      : iconData,
                  size: 20.sp,
                  color: index == _mainApplicationController.bottomNavIdx.value
                      ? Constants.primaryColor
                      : Constants.darkGreenVariantColor),
            ],
          ),
        );
      }),
    );
  }
}
