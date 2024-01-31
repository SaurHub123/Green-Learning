import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/about_us_screen.dart';
import 'package:green_learning/views/common/privacy_policy_screen.dart';
import 'package:green_learning/views/main_screens/account/account_components.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("users")
                        .doc("8937936970")
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2.h),
                            Text(
                              "Complete your Profile",
                              style: GoogleFonts.rajdhani(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    Constants.lightBorderColor.withOpacity(0.8),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 1.5.h),
                            AccountComponents.progressTile(39),
                            SizedBox(height: 1.h),
                            Divider(color: Constants.lightBorderColor),
                            SizedBox(height: 2.h),
                            AccountComponents.profileTile(
                              "assets/images/avt1.png",
                              "Sumit Sauravt1.png",
                              "kajalrituraj2002@gmail.com",
                            ),
                            SizedBox(height: 2.h),
                            AccountComponents.completeProfileBtn(
                                "Complete Profile"),
                            SizedBox(height: 2.h),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Constants.primaryColor,
                          ),
                        );
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                width: 100.w,
                color: Constants.accountLightGreen,
                child: Text(
                  "For Users",
                  style: GoogleFonts.rajdhani(
                    fontSize: 16.sp,
                    color: Constants.accountDarkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    AccountComponents.menuList(
                      Icons.person,
                      "Registrations/Applications",
                    ),
                    AccountComponents.menuList(
                      Icons.heart_broken,
                      " Watchlist",
                    ),
                    AccountComponents.menuList(Icons.panorama, "Certificates"),
                    AccountComponents.menuList(
                      Icons.money,
                      "Coupons and Rewards",
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AboutUsScreen());
                      },
                      child: AccountComponents.menuList(
                        Icons.money,
                        "About Us",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const PrivacyPolicyScreen());
                      },
                      child: AccountComponents.menuList(
                        Icons.money,
                        "Privacy and Policy",
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                width: 100.w,
                color: Constants.accountLightGreen,
                child: Text(
                  "App",
                  style: GoogleFonts.rajdhani(
                    fontSize: 16.sp,
                    color: Constants.accountDarkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    AccountComponents.menuList(Icons.settings, "Settings"),
                    SizedBox(height: 2.h),
                    Divider(color: Constants.lightBorderColor),
                    SizedBox(height: 1.h),
                    AccountComponents.logoutBtn("Logout", Icons.logout),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              AccountComponents.addBtn(
                  "Projects",
                  "Craft an engaging story in your bio "
                      "and make meaningful connections with peers and recruiters alike!",
                  'assets/images/addimg.png'),
              SizedBox(
                height: 2.h,
              ),
              AccountComponents.addBtn(
                  "Skills",
                  "Craft an engaging story in your bio "
                      "and make meaningful connections with peers and recruiters alike!",
                  'assets/images/addimg.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tile(String title, IconData iconData) {
    return Container();
  }
}
