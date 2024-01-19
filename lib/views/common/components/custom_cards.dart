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
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftCurved ? 15.sp : 0),
            bottomLeft: Radius.circular(leftCurved ? 15.sp : 0),
            topRight: Radius.circular(leftCurved ? 0 : 15.sp),
            bottomRight: Radius.circular(leftCurved ? 0 : 15.sp),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
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
              width: 3.w,
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

  static Widget simpleIconTextCard(
    double height,
    Color bgColor,
    String title,
    IconData iconData,
  ) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: bgColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(1.5.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                iconData,
                color: Colors.black,
                size: 18.sp,
              ),
            ),
          ),
          SizedBox(height: 2.5.w),
          Container(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
