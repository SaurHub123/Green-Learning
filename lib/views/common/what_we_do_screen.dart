import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WhatWeDoScreen extends StatefulWidget {
  const WhatWeDoScreen({super.key});

  @override
  State<WhatWeDoScreen> createState() => _WhatWeDoScreenState();
}

class _WhatWeDoScreenState extends State<WhatWeDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
        ),
      ),
    );
  }
}
