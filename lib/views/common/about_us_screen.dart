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
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        // color: Colors.yellow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Empowering Minds, Transforming Futures",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Mission Statement:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                                "At [Organization Name], our mission is clear: to democratize education by providing free and accessible resources to learners worldwide. We believe that knowledge is a universal right and should be within reach of everyone, regardless of their background or circumstances."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Our Vision:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                                "We envision a world where education is not a privilege but a fundamental right, empowering individuals to shape their destinies and contribute positively to society."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Who We Are:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                                "is a non-profit organization dedicated to creating a culture of inclusivity and empowerment through education. We are driven by the belief that education is the key to unlocking potential and fostering positive change."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Community Engagement:",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                                "s more than just a platform; it's a community. Join us as a learner, volunteer, donor, or supporter, and be part of a movement that believes in the transformative power of education."),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Join Us in shaping a world where education is a right, not a privilege. Explore, learn, and grow with us!",
                              style: GoogleFonts.rajdhani(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
