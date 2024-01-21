import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/custom_buttons.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:green_learning/views/main_screens/courses/courses_components.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      MaterialCommunityIcons.menu,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.25.w,
                width: 100.w,
                color: Constants.darkBorderColor,
              ),
              Expanded(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF7F7F8),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back, Mr. Sumit Saurav",
                              style: GoogleFonts.rajdhani(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 25,
                              width: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://img.icons8.com/color/48/confetti.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Let's learn something new...",
                          style: GoogleFonts.rajdhani(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton.secondaryIconOutlineButton(
                                Icons.bookmark,
                                "Wishlist",
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: CustomButton.secondaryIconFilledButton(
                                Icons.bookmark,
                                "Explore",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Learn more",
                          style: GoogleFonts.rajdhani(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        CoursesComponents.learnMoreComponents(),
                        // CustomCards.singleTrackCard(),
                        // CustomCards.singleTrackCard(),
                        // CustomCards.singleTrackCard(),
                        // CustomCards.singleTrackCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
