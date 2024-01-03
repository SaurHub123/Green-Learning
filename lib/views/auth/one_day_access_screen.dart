import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/custom_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OneDayAccessScreen extends StatefulWidget {
  const OneDayAccessScreen({super.key});

  @override
  State<OneDayAccessScreen> createState() => _OneDayAccessScreenState();
}

class _OneDayAccessScreenState extends State<OneDayAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Login",
                style: GoogleFonts.rajdhani(
                  color: Colors.black,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Enter your register phone number to \nget OTP.",
                style: GoogleFonts.rajdhani(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Color(0xffF4F3F1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Constants.primaryColor,
                      decoration: InputDecoration(
                        labelText: "Mobile number",
                        hintStyle: GoogleFonts.rajdhani(color: Colors.grey),
                        labelStyle: GoogleFonts.rajdhani(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.phone_in_talk_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              InkWell(
                onTap: () {},
                child: CustomButton.primaryButton("GET OTP"),
              ),
              SizedBox(height: 3.h),
              _otpWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
      width: 100.w,
      child: Column(
        children: [
          Text(
            "Enter the OTP sent on your registered mobile number",
            style: GoogleFonts.rajdhani(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.5.h),
          Container(
            width: 100.w,
            // height: 60,
            decoration: const BoxDecoration(
              color: Color(0xffF4F3F1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextFormField(
              cursorColor: Constants.primaryColor,
              maxLength: 6,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: GoogleFonts.rajdhani(
                letterSpacing: 30,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: "",
                label: Center(
                  child: Text(
                    "OTP",
                    style: GoogleFonts.rajdhani(),
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: GoogleFonts.rajdhani(color: Colors.grey),
                labelStyle: GoogleFonts.rajdhani(color: Colors.grey),
                border: InputBorder.none,
                // prefixIcon: const Icon(Icons.phone_in_talk_sharp),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          InkWell(
            onTap: () {},
            child: CustomButton.primaryButton("LOGIN"),
          ),
        ],
      ),
    );
  }
}
