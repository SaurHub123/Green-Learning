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
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            "Learn more",
            style: GoogleFonts.rajdhani(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF006767),
            ),
          ),
        ),
        SizedBox(height: 2.5.h),
        Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
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
                onTap: () {},
                child: CustomCards.simpleIconTextCard(
                  120,
                  Constants.aestheticPCPMauve.withOpacity(0.4),
                  "Coding/\nFull Stack",
                  Icons.code_outlined,
                ),
              )),
              SizedBox(width: 2.w),
              Expanded(
                child: InkWell(
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
}
