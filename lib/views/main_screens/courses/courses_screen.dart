import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:green_learning/views/common/components/faq_component.dart';
import 'package:green_learning/views/main_screens/courses/courses_components.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  var questions = [
    {
      "question": "abc",
      "answer": "answer",
    },
  ];

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
                CoursesComponents.learnMoreComponents(),
                CoursesComponents.imageBannerComponents(),
                FaqComponent.faqSection(questions),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                //   width: 100.w,
                //   child: const ExpansionTile(
                //     title: Text("question!"),
                //     collapsedBackgroundColor: Colors.red,
                //     collapsedTextColor: Colors.green,
                //     collapsedIconColor: Colors.yellow,
                //     backgroundColor: Colors.blue,
                //     textColor: Colors.amber,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text("answer"),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                //   width: 100.w,
                //   child: const ExpansionTile(
                //     title: Text("question!"),
                //     collapsedBackgroundColor: Colors.red,
                //     collapsedTextColor: Colors.green,
                //     collapsedIconColor: Colors.yellow,
                //     backgroundColor: Colors.blue,
                //     textColor: Colors.amber,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text("answer"),
                //       ),
                //     ],
                //   ),
                // )
                // FaqComponent.faqSection(questions)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
