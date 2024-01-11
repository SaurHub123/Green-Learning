import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCards {
  static Widget smallIconTextCard(
    String title,
    IconData iconData,
    Color bgColor,
    Color iconColor,
    Color? textColor,
    double? fontSize,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: bgColor,
            ),
            child: Icon(iconData, color: iconColor),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: GoogleFonts.rajdhani(
              color: textColor ?? Colors.black,
              fontSize: fontSize ?? 14.sp,
            ),
          )
        ],
      ),
    );
  }

  static Widget curvedCard(
    Color bgColor,
    Color iconBgColor,
    IconData iconData,
    Color iconColor,
    String title,
    String subTitle,
    bool leftCurved,
  ) {
    return Expanded(
      child: Container(
        height: 10.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftCurved ? 15.sp : 0),
            bottomLeft: Radius.circular(leftCurved ? 15.sp : 0),
            topRight: Radius.circular(leftCurved ? 0 : 15.sp),
            bottomRight: Radius.circular(leftCurved ? 0 : 15.sp),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: iconBgColor,
              ),
              child: Icon(
                iconData,
                color: iconColor,
              ),
            ),
            SizedBox(
              width: 1.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rajdhani(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.rajdhani(fontSize: 18.sp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
