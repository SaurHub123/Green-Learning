import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CustomCards.smallIconTextCard("Account", Icons.school,
                    Colors.red, Constants.primaryColor, null, null),
              ),
              Row(
                children: [
                  CustomCards.curvedCard(
                    Colors.yellow,
                    Colors.pink,
                    Icons.ac_unit_rounded,
                    Constants.primaryColor,
                    "2000+",
                    "Mentors",
                    true,
                  ),
                  SizedBox(width: 2.5.w),
                  CustomCards.curvedCard(
                    Colors.yellow,
                    Colors.pink,
                    Icons.ac_unit_rounded,
                    Constants.primaryColor,
                    "2000+",
                    "Mentors",
                    false,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
