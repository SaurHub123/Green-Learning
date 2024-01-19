import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqComponent {
  static Widget faqSection(List questions) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index]['question'];
        final answer = questions[index]['answer'];
        return faqTile("", "");
        //   ExpansionTile(
        //   title: Text(question!),
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(answer!),
        //     ),
        //   ],
        // );
      },
    );
  }

  static Widget faqTile(String question, String answer) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 2.5.w),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black,
            size: 18.sp,
          ),
        ],
      ),
    );
  }

  static Widget faqExpandedData(String question, String answer) {
    return Container(
        // child:,
        );
  }
}
