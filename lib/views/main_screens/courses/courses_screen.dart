import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/views/common/components/faq_component.dart';
import 'package:green_learning/views/main_screens/courses/courses_components.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  var faqQuestions = [
    {
      "question": "On what devices can I access the course?",
      "answer":
          "The course can be accessed on any device with an active internet connection. However, a laptop or PC will be required for attempting select projects and assignments.",
    },
    {
      "question": "For how long can I access the course after purchasing it?",
      "answer":
          "You will have access to complete learning material of the course for 1 year from the date of purchase of the course.",
    },
    {
      "question": "What do I receive after completing a course?",
      "answer":
          "You will receive a soft copy of the certificate after successfully completing the course. You can download this industry-recognized certificate in the pdf format and share it within your network.",
    },
    {
      "question": "Have an unresolved question?",
      "answer":
          "Please write to support@unstop.com with any further questions.",
    },
  ];
  final MainApplicationController _mainApplicationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          // padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    "Learn more",
                    style: GoogleFonts.rajdhani(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF006767),
                    ),
                  ),
                ),
                SizedBox(height: 2.5.h),
                CoursesComponents.learnMoreComponents(),
                CoursesComponents.imageBannerComponents(),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    "Frequently Asked Questions",
                    style: GoogleFonts.rajdhani(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF006767),
                    ),
                  ),
                ),
                SizedBox(height: 2.5.h),
                Container(
                  height: (faqQuestions.length * (70 + 7.5.w)) + 130,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: FaqComponent.faqSection(
                    faqQuestions,
                    _mainApplicationController,
                  ),
                ),
                SizedBox(height: 7.5.h),
                CoursesComponents.footerComponents(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
