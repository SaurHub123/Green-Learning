import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/components/faq_component.dart';
import 'package:green_learning/views/main_screens/courses/all_career_goal_screen.dart';
import 'package:green_learning/views/main_screens/courses/courses_components.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
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
  var banners = [
    {
      "tag": "New",
      "icon": Foundation.burst_new,
      "title": "Computer Science",
      "image": "assets/svgs/data-scientists.svg",
      "bgColor": const Color(0xFFEDDEF6),
      "key": Constants.computerScience,
    },
    {
      "tag": "Trending",
      "icon": Icons.trending_up_outlined,
      "title": "9th - 12th Study Material",
      "image": "assets/svgs/android-developer.svg",
      "bgColor": const Color(0xFFFFC8C4),
      "key": Constants.nineTh12ThMaterial,
    },
    {
      "tag": "New",
      "icon": Foundation.burst_new,
      "title": "Competitive Exams",
      "image": "assets/svgs/web-developer.svg",
      "bgColor": const Color(0xFFB5E8A4),
      "key": Constants.competitiveExams,
    }
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
                Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        "Career Goals",
                        style: GoogleFonts.rajdhani(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(
                        height: banners.length * (160 + 2.5.w),
                        width: 100.w,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: banners.length,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => AllCareerGoalScreen(
                                          careerKey:
                                              banners[index]["key"]! as String,
                                          careerTitle: banners[index]["title"]!
                                              as String,
                                        ),
                                      );
                                    },
                                    child: enhancementBanner(
                                      banners[index]["tag"]! as String?,
                                      banners[index]["title"]! as String?,
                                      banners[index]["image"]! as String?,
                                      banners[index]["bgColor"] as Color,
                                      banners[index]["icon"] as IconData,
                                    ),
                                  ),
                                  SizedBox(height: 2.5.w),
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
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

  Widget enhancementBanner(String? tag, String? title, String? image,
      Color bgColor, IconData? iconData) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 140,
            width: 120,
            child: SvgPicture.asset(
              image!,
            ),
          ),
          SizedBox(width: 2.5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tag!,
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffE54AD3),
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 2.5.w),
                    iconData != null
                        ? Icon(
                            iconData,
                            size: 19.sp,
                            color: const Color(0xffE54AD3),
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(height: 2.5.w),
                Text(
                  title!,
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
        ],
      ),
    );
  }
}
