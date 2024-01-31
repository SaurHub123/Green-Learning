import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResourcesWebsiteScreen extends StatefulWidget {
  const ResourcesWebsiteScreen({super.key});

  @override
  State<ResourcesWebsiteScreen> createState() => _ResourcesWebsiteScreenState();
}

class _ResourcesWebsiteScreenState extends State<ResourcesWebsiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.red,
      ),
    );
  }
}
