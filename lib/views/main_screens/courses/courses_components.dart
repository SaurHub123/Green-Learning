import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursesComponents {
  static Widget learnMoreComponents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {},
                  child: CustomCards.simpleIconTextCard(
                    100,
                    Constants.aestheticPCPJordyBlue.withOpacity(0.5),
                    "Aptitude",
                    FontAwesome.lightbulb_o,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {},
                  child: CustomCards.simpleIconTextCard(
                    100,
                    Constants.aestheticPCPPinkLavendar.withOpacity(0.5),
                    "Next Gen Skills",
                    FontAwesome.braille,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.5.w),
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {},
                  child: CustomCards.simpleIconTextCard(
                    120,
                    Constants.aestheticPCPMauve.withOpacity(0.4),
                    "Coding/\nFull Stack",
                    Icons.code_outlined,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {},
                  child: CustomCards.simpleIconTextCard(
                    120,
                    Constants.aestheticPCPTitanyBlue.withOpacity(0.2),
                    "Platform/Tools",
                    Icons.storage,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {},
                  child: CustomCards.simpleIconTextCard(
                    120,
                    Constants.aestheticPCPSunset.withOpacity(0.5),
                    "Interview Preparation",
                    Icons.record_voice_over_outlined,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  static Widget imageBannerComponents() {
    return Container();
  }

  static Widget footerComponents() {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            const Color(0xFFFFE190).withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 80.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/footer_unstoppable.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 1.5.w),
          Container(
            //
            width: 100.w,
            padding: EdgeInsets.symmetric(vertical: 1.5.w),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: statsTile("130", "K+", "Users Joined"),
                ),
                Expanded(
                  child: statsTile("78", "+", "Countries"),
                ),
                Expanded(
                  child: statsTile("800", "+", "Brands Trust"),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  static Widget statsTile(String blackText, String coloredText, String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              blackText,
              style: GoogleFonts.rajdhani(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " $coloredText",
              style: GoogleFonts.rajdhani(
                fontSize: 16.sp,
                color: const Color(0xFFF3B61F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: GoogleFonts.rajdhani(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
