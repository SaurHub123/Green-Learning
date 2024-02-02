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

  static Widget secondaryIconOutlineButton(IconData iconData, String text) {
    return Container(
      width: 100.w,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Constants.darkGreenVariantColor, width: 2.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 18.sp,
            color: Constants.primaryColor,
          ),
          SizedBox(width: 2.5.w),
          Text(
            text,
            style: GoogleFonts.rajdhani(
              fontSize: 16.sp,
              color: Constants.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget secondaryIconFilledButton(IconData iconData, String text) {
    return Container(
      width: 100.w,
      height: 50,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        border: Border.all(color: Constants.darkGreenVariantColor, width: 2.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 18.sp,
            color: Colors.white,
          ),
          SizedBox(width: 2.5.w),
          Text(
            text,
            style: GoogleFonts.rajdhani(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static Widget secondaryGreyIconFilledButton(IconData iconData, String text) {
    return Container(
      width: 100.w,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Constants.darkGreenVariantColor, width: 2.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 18.sp,
            color: Colors.white,
          ),
          SizedBox(width: 2.5.w),
          Text(
            text,
            style: GoogleFonts.rajdhani(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
