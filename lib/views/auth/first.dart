import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
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
                "Where are you?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Save food for a needy everytime you\nprebook a meal",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 8.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xffFEF7E7),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffF8DB72))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/employee.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "EMPLOYEE",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 8.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xffFEF7E7),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffF8DB72))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/avatar.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "POS Suy",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 3.h),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 8.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xffFEF7E7),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xffF8DB72))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/businessman.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Business",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
