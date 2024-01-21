import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllSubjectScreen extends StatefulWidget {
  const AllSubjectScreen({super.key});

  @override
  State<AllSubjectScreen> createState() => _AllSubjectScreenState();
}

class _AllSubjectScreenState extends State<AllSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
