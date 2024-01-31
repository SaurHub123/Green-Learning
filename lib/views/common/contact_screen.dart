import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bc_contact.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    Text(
                      "Hello",
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 14.sp,
                      color: Colors.yellow,
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18.sp,
                            ),
                            Text(
                              "Email",
                              style: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          "Abc@gmail.com",
                          style:
                              GoogleFonts.rajdhani(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 18.sp,
                            ),
                            Text(
                              "Phone",
                              style: GoogleFonts.rajdhani(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          "+91 0000000000",
                          style:
                              GoogleFonts.rajdhani(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.all(2.5.w),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusColor: Colors.blue,
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                          labelText: "Phone",
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      const TextField(
                        // controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Anything Else You want to know",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 7.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  color: Constants.primaryColor,
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 17.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
