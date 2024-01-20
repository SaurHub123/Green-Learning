import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountComponents {
  static Widget progressTile(double progressValue) {
    return LinearProgressIndicator(
      value: progressValue,
      backgroundColor: Colors.black,
    );
  }

  static Widget profileTile() {
    return Container(
      child: Column(
        children: [
          // profile
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                AccountComponents.statsTile(
                    Icons.safety_check, Colors.red, "1220"),
                AccountComponents.statsTile(
                    Icons.safety_check, Colors.red, "1220"),
                AccountComponents.statsTile(
                    Icons.safety_check, Colors.red, "1220"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget statsTile(IconData iconData, Color iconColor, String title) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            iconData,
            size: 20.sp,
            color: iconColor,
          ),
          Text(
            title,
            style: GoogleFonts.rajdhani(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
