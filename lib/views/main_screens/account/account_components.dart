import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants.dart';

class AccountComponents {
  static Widget progressTile(double progressValue) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 100.w,
            height: 11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.sp),
                topRight: Radius.circular(50.sp),
              ),
              color: Constants.lightBorderColor.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Container(
                  width: progressValue.w,
                  height: 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.sp),
                      topRight: Radius.circular(50.sp),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF21D375),
                        Color(0xFF073B3A),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 2.5.w),
        Text(
          '${(progressValue * 1).toStringAsFixed(0)}%', // Example percentage
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  static Widget profileTile(
    String imagePath,
    String name,
    String email,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor,
                  width: 6.sp,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.rajdhani(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Constants.accountDarkGreen,
                    ),
                  ),
                  Text(
                    email,
                    style: GoogleFonts.rajdhani(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Constants.accountDarkGreen.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              AccountComponents.statsTile(
                Icons.grade,
                const Color(0xFF800000),
                "1220",
              ),
              Container(
                height: 20,
                width: 2,
                color: Constants.lightBorderColor,
              ),
              AccountComponents.statsTile(
                MaterialCommunityIcons.coins,
                const Color(0xFF510993),
                "1220",
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget statsTile(IconData iconData, Color iconColor, String title) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 20.sp,
            color: iconColor,
          ),
          SizedBox(width: 2.5.w),
          Text(
            title,
            style: GoogleFonts.rajdhani(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: Constants.accountDarkGreen,
            ),
          ),
          Container(width: 1, color: Colors.black),
        ],
      ),
    );
  }

  static Widget completeProfileBtn(String title) {
    return Container(
      alignment: Alignment.center,
      height: 5.h,
      decoration: BoxDecoration(
        color: Constants.accountLightGreen,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        title,
        style: GoogleFonts.rajdhani(
          fontSize: 16.sp,
          color: Constants.accountDarkGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget menuList(IconData iconData, String title) {
    return SizedBox(
      height: 5.h,
      width: 100.w,
      // color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Constants.primaryColor,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }

  static Widget logoutBtn(String title, IconData iconData) {
    return Container(
      alignment: Alignment.center,
      height: 5.h,
      padding: EdgeInsets.symmetric(vertical: 1.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(
          color: Constants.accountDarkGreen,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.rajdhani(
              fontSize: 16.sp,
              color: Constants.accountDarkGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 2.w),
          Icon(
            iconData,
            size: 17.sp,
            color: Constants.accountDarkGreen,
          ),
        ],
      ),
    );
  }

  static Widget addBtn(String title, String subTitle, String imagePath) {
    return Container(
      height: 20.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Color(0xffF6F8FA),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Text(
                        title,
                        style: GoogleFonts.rajdhani(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff727272)),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        subTitle,
                        style: GoogleFonts.rajdhani(
                            fontSize: 15.sp, color: Color(0xffafafaf)),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  width: 30.w,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 3.5.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Color(0xffebebeb),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.sp),
                bottomRight: Radius.circular(15.sp),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add",
                  style: GoogleFonts.rajdhani(
                      color: Color(0xff383838), fontSize: 16.sp),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Icon(
                  Icons.add,
                  color: Color(0xff383838),
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
