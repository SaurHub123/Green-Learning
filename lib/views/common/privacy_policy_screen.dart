import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  child: Text(
                    "Review The \nPrivacy and Policy",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rajdhani(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                ,style: GoogleFonts.rajdhani(),
                ),
                SizedBox(height: 2.h,),
                Row(
                    children:[
                      Text("\u2022", style: TextStyle(fontSize: 30),), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Lorem Ipsum has been Hello World", style: GoogleFonts.rajdhani(fontSize: 18.sp,fontWeight: FontWeight.bold),), //text
                      )
                    ]
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lore but also the leap into electronic typesetting, remaining essentially unchanged. "
                  ,style: GoogleFonts.rajdhani(),
                ),
                Row(
                    children:[
                      Text("\u2022", style: TextStyle(fontSize: 30),), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Lorem Ipsum has been Hello World", style: GoogleFonts.rajdhani(fontSize: 18.sp,fontWeight: FontWeight.bold),), //text
                      )
                    ]
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lore but also the leap into electronic typesetting, remaining essentially unchanged. "
                  ,style: GoogleFonts.rajdhani(),
                ),
                SizedBox(height: 2.h,),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                  ,style: GoogleFonts.rajdhani(),
                ),
                SizedBox(height: 2.h,),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "
                  ,style: GoogleFonts.rajdhani(),
                ),
                SizedBox(height: 2.h,),
                Row(
                    children:[
                      Text("\u2022", style: TextStyle(fontSize: 30),), //bullet text
                      SizedBox(width: 10,), //space between bullet and text
                      Expanded(
                        child:Text("Lorem Ipsum has been Hello World", style: GoogleFonts.rajdhani(fontSize: 18.sp,fontWeight: FontWeight.bold),), //text
                      )
                    ]
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lore but also the leap into electronic typesetting, remaining essentially unchanged. "
                  ,style: GoogleFonts.rajdhani(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
