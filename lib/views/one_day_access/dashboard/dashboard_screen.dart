import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/custom_buttons.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var banners = [
    {
      "tag": "New",
      "title": "Data Scientist",
      "image": "assets/svgs/data-scientists.svg",
      "bgColor": const Color(0xFFEDDEF6),
    },
    {
      "tag": "New",
      "title": "Android Development",
      "image": "assets/svgs/android-developer.svg",
      "bgColor": const Color(0xFFFFC8C4),
    },
    {
      "tag": "New",
      "title": "Web Development",
      "image": "assets/svgs/web-developer.svg",
      "bgColor": const Color(0xFFB5E8A4),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      MaterialCommunityIcons.menu,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
              Container(
                height: 0.25.w,
                width: 100.w,
                color: Constants.darkBorderColor,
              ),
              Expanded(
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF7F7F8),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back, Mr. Sumit Saurav",
                              style: GoogleFonts.rajdhani(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              height: 25,
                              width: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://img.icons8.com/color/48/confetti.png",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Let's learn something new...",
                          style: GoogleFonts.rajdhani(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton.secondaryIconOutlineButton(
                                Icons.bookmark,
                                "Explore",
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: CustomButton.secondaryIconFilledButton(
                                Icons.bookmark,
                                "Explore",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Container(
                          height: 160,
                          width: 100.w,
                          // margin: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: banners.length,
                              itemBuilder: (context, index) {
                                return enhancementBanner(
                                  banners[index]["tag"]! as String?,
                                  banners[index]["title"]! as String?,
                                  banners[index]["image"]! as String?,
                                  banners[index]["bgColor"]! as Color,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget enhancementBanner(
      String? tag, String? title, String? image, Color bgColor) {
    return Container(
      height: 150,
      width: 80.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(3.sp),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(),
            child: SvgPicture.asset(
              image!,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(tag!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
