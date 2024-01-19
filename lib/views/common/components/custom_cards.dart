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

  static Widget singleTrackCard() {
    return Container(
      // height: 250,
      width: 70.w,
      decoration: BoxDecoration(
        color: const Color(0xfff6f8fa),
        borderRadius: BorderRadius.circular(1.w),
        border: Border.all(
          color: const Color(0xffDADCE0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 3.w, top: 2.5.w),
            child: Row(
              children: [
                SizedBox(
                  height: 15.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: const Color(0xffA391FF),
                              borderRadius: BorderRadius.circular(1.w),
                            ),
                            child: Text(
                              'Netflix',
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 2.5.w),
                      Text(
                        "Movie",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rajdhani(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/test1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xffDADCE0)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 2.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.play_lesson,
                      color: const Color(0xff747474),
                      size: 16.sp,
                    ),
                    Text(
                      " 3x Lessons ",
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff747474),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  "American Express Data Analysis ",
                  style: GoogleFonts.rajdhani(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff383838),
                    fontSize: 17.sp,
                  ),
                ),
                Text(
                  "The American Express Data Analysis course o ",
                  style: GoogleFonts.rajdhani(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff747474),
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("View Course"),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xff747474),
                      size: 16.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
