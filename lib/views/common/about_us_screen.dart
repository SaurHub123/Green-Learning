import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/about.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: AppBar().preferredSize.height,
              left: 2.5.w,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
            Positioned(
              top: 17.5.h,
              child: Container(
                height: 82.5.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: const Color(0xffd3e3ee),
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 13.h,
                      ),
                      Container(
                        // color: Colors.deepPurpleAccent,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        // color: Colors.yellow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Uniford Foundation: Expanding Access to Education",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const Text(
                                "At Uniford Foundation, we believe that education is a fundamental human right that should be available to all, regardless of socioeconomic status or geography. Established in 2019, our non-profit organization is driven by a vision of a world where every motivated mind has the opportunity to transform their lives through learning."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Our Roots:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Text(
                                "Uniford was founded by a group of educators, activists and philanthropists who came together to address the glaring education gap that exists both in our own country and globally. They firmly believed that with the right tools and systems, we can empower underserved communities to lift themselves out of the cycle of poverty."),
                            SizedBox(
                              height: 2.h,
                            ),

                            const Text(
                                "Our founders’ experiences volunteering in rural areas revealed bright students turning away from school due to lack of access, resources and support. It became Uniford’s mission to reshape this reality."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "What We Do:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "We provide the scaffolding needed to fortify education worldwide through:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            // School Sponsorships:
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'School Sponsorships: ',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Optional color setting
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        'By funding the operations and facilities of schools in remote areas, we enable free access to quality education for thousands of children.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // Digital Access Programs:
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Digital Access Programs: ',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Optional color setting
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        'By funding the operations and facilities of schools in remote areas, we enable free access to quality education for thousands of children.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // Scholarships & Grants:
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Scholarships & Grants: ',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Optional color setting
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        'We offer financial aid to meritorious students from disadvantaged backgrounds to access higher education and vocational skills training.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // E-Learning Platform:
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'E-Learning Platform: ',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Optional color setting
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        'Our online portal hosts courses and study resources accessible by mobile device, assisting self-learners globally.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),

                            // Mentorship Networks:
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Mentorship Networks:  ',
                                    style: GoogleFonts.rajdhani(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .black, // Optional color setting
                                    ),
                                  ),
                                  const TextSpan(
                                    text:
                                        'By connecting students to leaders across industries for guidance, we empower them to maximize opportunities.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),

                            Text(
                              "Our Impact",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Text(
                                "Starting with just three remote village schools, Uniford Foundation now supports over 100 learning centers across 6 countries, handing out more than 5,000 scholarships yearly. Our graduates include doctors, entrepreneurs and leaders catalyzing progress in their communities."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          'As our founder chairman Nelson Wiley puts it,',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text:
                                          ' “The journey forward is long, but our strides are firm and focused. We remain committed to the vision of making education borderless.”',
                                      style: GoogleFonts.rajdhani(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Join Our Journey",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Text(
                                "Uniford is powered by a tribe of passionate individuals - sponsors, volunteers, partner non-profits and beneficiaries come together in this mission to reshape lives through learning. Become a part of our story today."),

                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              child: Container(
                // padding: EdgeInsets.all(5.sp),
                height: 16.h,
                width: 16.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Constants.primaryColor,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(14.sp))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/abt.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
