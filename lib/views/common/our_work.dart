import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OurWork extends StatefulWidget {
  const OurWork({super.key});

  @override
  State<OurWork> createState() => _OurWork();
}

class _OurWork extends State<OurWork> {
  var ourWorkList = [
    {
      "title": "Rural School Adoption",
      "image": "assets/images/our_work_adoption.jpeg",
      "points": [
        "Adopted 12 village schools across 4 districts of Maharashtra, India reaching over 5,000 students yearly",
        "Funding provided for infrastructure, teacher salaries, learning materials and midday meals",
        "Schools reporting 30% higher literacy rates and 50% reduction in student dropouts",
      ],
    },
    {
      "title": "Digital Classrooms",
      "image": "assets/images/our_work_digital.jpeg",
      "points": [
        "Set up computer labs with internet access in 35 rural schools in Guatemala & Kenya",
        "Over 100,000 students impacted with access to online courses, resources & global classrooms",
        "Partnered with Microsoft & Khan Academy on software and content localization",
      ],
    },
    {
      "title": "Skills Training Centers",
      "image": "assets/images/our_work_skills_center.png",
      "points": [
        "Established 6 centers offering vocational programs like retail, hospitality & IT across tier 2 cities in India",
        "Provided job linkages, with over 75% of 1500 graduates placed annually",
        "Training fund of \$250,000 set up to sponsor meritorious but needy students"
      ],
    },
    {
      "title": "Refugee STEM Program",
      "image": "assets/images/our_work_stem.jpeg",
      "points": [
        "Online STEM education initiative for displaced Syrian students in partnership with UNHCR",
        "300+ students enrolled in virtual courses & mentorship programs through our platform",
        "Opportunity for scholarships at universities across Europe & Middle East",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Constants.primaryColor,
                          size: 20.sp,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Our Work",
                            style: GoogleFonts.rajdhani(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Constants.primaryColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "At Uniford Foundation, our work spans borders, oceans and the full span of the educational journey - from building primary schools to enabling professional development - with one mission: to make quality learning accessible to all. \n\n Here are some highlights of initiatives we have undertaken over the past 5 years to empower students around the globe:",
                  style: GoogleFonts.rajdhani(
                    color: Colors.black87,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                for (var i = 0; i < ourWorkList.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ourWorkList[i]["title"] as String,
                        style: GoogleFonts.rajdhani(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: Constants.primaryColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.5.w),
                      Container(
                        height: 180,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          image: DecorationImage(
                            image: AssetImage(
                              ourWorkList[i]["image"] as String,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5.w),
                      buildPoints(ourWorkList[i]["points"]),
                      SizedBox(height: 7.5.w),
                    ],
                  ),
                // SizedBox(
                //   height: 150,
                //   width: 100.w,
                //   child: ListView(
                //     children: [
                //       const Text(
                //         'Read More Example',
                //         style: TextStyle(
                //           fontSize: 30,
                //         ),
                //       ),
                //       //text widget to display long text
                //       buildText(
                //         "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                //       ),
                //       ElevatedButton(
                //         onPressed: () {
                //           print("lop");
                //           setState(() {
                //             // toggle the bool variable true or false
                //             isReadmore = !isReadmore;
                //           });
                //         },
                //         child: Text(
                //           (isReadmore ? 'Read Less' : 'Read More'),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPoints(var data) {
    return Column(
      children: [
        for (var j = 0; j < data.length; j++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_right,
                color: Colors.black54,
                size: 20.sp,
              ),
              Expanded(
                child: Text(
                  data[j],
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
      ],
    );
  }

  // Widget buildText(String text) {
  //   // if read more is false then show only 3 lines from text
  //   // else show full text
  //   final lines = isReadmore ? null : 3;
  //   return Text(
  //     text,
  //     style: const TextStyle(fontSize: 25),
  //     maxLines: lines,
  //     // overflow properties is used to show 3 dot in text widget
  //     // so that user can understand there are few more line to read.
  //     overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
  //   );
  // }
}
