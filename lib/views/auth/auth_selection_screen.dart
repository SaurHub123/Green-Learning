import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/auth/one_day_access_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthSelectionScreen extends StatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  State<AuthSelectionScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<AuthSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7.h),
            Text(
              "How You want to access?",
              style: GoogleFonts.rajdhani(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Save food for a needy everytime you\nprebook a meal",
              style: GoogleFonts.rajdhani(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.h),
            _selectionTile("One Day Access", "assets/images/employee.png", 1),
            SizedBox(height: 3.h),
            _selectionTile("Limited Access", "assets/images/avatar.png", 2),
          ],
        ),
      ),
    );
  }

  Widget _selectionTile(String title, String imgUrl, int index) {
    return InkWell(
      onTap: () {
        if (index == 1) {
          Get.to(() => const OneDayAccessScreen());
        } else {}
      },
      child: Container(
          height: 8.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2.5.sp)),
            // border: Border.all(
            //     // color: const Color(0xffF8DB72),
            //     ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                title,
                style: GoogleFonts.rajdhani(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
