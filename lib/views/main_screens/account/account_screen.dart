import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/main_screens/account/account_components.dart';
// import 'package:green_learning/views/main_screens/account/profile_menu.dart';
import 'package:green_learning/views/main_screens/account/update_profile_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

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
          child: Container(
            padding: EdgeInsets.all(5.w),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                SizedBox(
                  width:90.w, // Example width constraint
                  child: Text(
                    "Complete your Profile",
                    style: GoogleFonts.rajdhani(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 1.5.h,),
                AccountComponents.progressTile(0.39),
                SizedBox(height: 1.h,),
                Divider(),
                SizedBox(height: 2.h,),
                AccountComponents.profileTile("assets/images/avt1.png","Kajal Rituraj", "kajalrituraj2002@gmail.com",),
                SizedBox(height: 2.h,),
                AccountComponents.completeProfileBtn("Complete Profile"),
            SizedBox(height: 2.h,),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              height: 4.h,
              color: Color(0xfff2f8fe),
              child: Text(
                "For Users",
                style: GoogleFonts.rajdhani(
                    fontSize: 16.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
                SizedBox(height: 2.h,),
                AccountComponents.menuList(Icons.person,  "Registrations/Applications "),
                AccountComponents.menuList(Icons.heart_broken,  " Watchlist"),
                AccountComponents.menuList(Icons.panorama,  "Certificates"),
                AccountComponents.menuList(Icons.money,  "Coupans and Rewards"),
                AccountComponents.menuList(Icons.settings,  "Settings"),
                Divider(),
                SizedBox(height: 2.h,),
                AccountComponents.logoutBtn("Logout",Icons.logout),
                SizedBox(height: 2.h,),
                AccountComponents.addBtn("Projects","Craft an engaging story in your bio "
                    "and make meaningful connections with peers and recruiters alike!",'assets/images/addimg.png'),
                SizedBox(height: 2.h,),
                AccountComponents.addBtn(
                    "Skills",
                    "Craft an engaging story in your bio "
                        "and make meaningful connections with peers and recruiters alike!",
                    'assets/images/addimg.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile(String title, IconData iconData) {
    return Container();
  }
}
