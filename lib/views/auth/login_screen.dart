import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back,
                    size: 23.sp,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "Hello \nSign In",
                style: GoogleFonts.arima(
                  color: Colors.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                width: 100.w,
                padding: EdgeInsets.all(2.5.w),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Username",
                        prefixIcon: Icon(Icons.people),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusColor: Colors.blue,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password ?",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffF8DB72),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h
              ),
              InkWell(
                onTap: (){
                  // Sign In Logic
                },
                child: Container(
                  height: 5.h,
                  width: 80.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8DB72),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    // border: Border.all(color: Colors.black)
                  ),
                  child: Text(
                    "SIGN IN",
                    style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "SignUp",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffF8DB72),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
