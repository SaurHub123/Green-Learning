import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OurWork extends StatefulWidget {
  OurWork({super.key});

  @override
  State<OurWork> createState() => _OurWork();
}

class _OurWork extends State<OurWork> {
  bool isReadmore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.deepPurpleAccent,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Our Roots:",
                  style: GoogleFonts.rajdhani(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Text(
                    "Uniford was founded by a group of educators, activists and philanthropists who came together to address the glaring education gap that exists both in our own country and globally. They firmly believed that with the right tools and systems, we can empower underserved communities to lift themselves out of the cycle of poverty."),
                SizedBox(
                  height: 2.h,
                ),
                ListView(
                  children: [
                    Text(
                      'Read More Example',
                      style: TextStyle(fontSize: 30),
                    ),
                    //text widget to display long text
                    buildText(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // toggle the bool variable true or false
                            isReadmore = !isReadmore;
                          });
                        },
                        child: Text((isReadmore ? 'Read Less' : 'Read More')))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: TextStyle(fontSize: 25),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
