import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationFormScreen extends StatefulWidget {
  final bool update;

  const RegistrationFormScreen({
    super.key,
    required this.update,
  });

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Constants.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 2.5.w),
                    Expanded(
                      child: Text(
                        widget.update ? "Update Profile" : "Registration",
                        style: GoogleFonts.rajdhani(
                          color: Constants.primaryColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Start Form Code..
            ],
          ),
        ),
      ),
    );
  }
}
