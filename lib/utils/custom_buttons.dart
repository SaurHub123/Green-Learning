import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton {
  static Widget primaryButton(String text) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 3.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget primaryProgressButton() {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 3.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
