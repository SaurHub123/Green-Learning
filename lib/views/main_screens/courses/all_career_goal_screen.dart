import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCareerGoalScreen extends StatefulWidget {
  final String careerKey;

  const AllCareerGoalScreen({super.key, required this.careerKey});

  @override
  State<AllCareerGoalScreen> createState() => _AllCareerGoalScreenState();
}

class _AllCareerGoalScreenState extends State<AllCareerGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        MaterialCommunityIcons.arrow_left,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "Computer Science Tracks",
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  // child:
                  ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget slidingPanel() {
    return Container();
  }
}
