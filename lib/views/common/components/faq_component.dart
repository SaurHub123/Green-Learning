import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class FaqComponent {
  static Widget faqSection(
    List questions,
    MainApplicationController mainApplicationController,
  ) {
    return ListView.builder(
      itemCount: questions.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final question = questions[index]['question'];
        final answer = questions[index]['answer'];
        return Obx(() {
          return Column(
            children: [
              faqTile(question, answer, mainApplicationController, index),
              mainApplicationController.selectedFaq.value == index
                  ? faqExpandedData(answer)
                  : const SizedBox(),
              SizedBox(height: 2.5.w),
            ],
          );
        });
      },
    );
  }

  static Widget faqTile(
    String question,
    String answer,
    MainApplicationController mainApplicationController,
    int index,
  ) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        mainApplicationController.selectedFaq.value = index;
      },
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFffbd77).withOpacity(0.1),
              const Color(0xFFf0f4a4).withOpacity(0.2),
              const Color(0xFFacfcd9).withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.rajdhani(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.5.w),
            Icon(
              mainApplicationController.selectedFaq.value == index
                  ? Icons.keyboard_arrow_up_outlined
                  : Icons.keyboard_arrow_down_outlined,
              color: Colors.black,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }

  static Widget faqExpandedData(String answer) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
      child: Text(
        answer,
        textAlign: TextAlign.justify,
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
