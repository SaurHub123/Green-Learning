import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetOtp extends StatefulWidget {
  const GetOtp({super.key});

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back,
                    size: 23.sp,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Enter your register phone number to \nget OTP.",
                style: TextStyle(
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
                  // border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "999999999",
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4.h),
              // otp

              InkWell(
                onTap: () {
                  // Sign In Logic
                },
                child: Container(
                  height: 5.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8DB72),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    // border: Border.all(color: Colors.black)
                  ),
                  child: Text(
                    "GET OTP",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "SignUp",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffF8DB72),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
