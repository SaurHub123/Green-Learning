import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/auth_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/custom_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OneDayAccessScreen extends StatefulWidget {
  const OneDayAccessScreen({super.key});

  @override
  State<OneDayAccessScreen> createState() => _OneDayAccessScreenState();
}

class _OneDayAccessScreenState extends State<OneDayAccessScreen> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Login",
                style: GoogleFonts.rajdhani(
                  color: Colors.black,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.5.h),
              Text(
                "Enter your register phone number to \nget OTP.",
                style: GoogleFonts.rajdhani(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.5.h),
              Container(
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Color(0xffF4F3F1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      enabled: !_authController.otpSent.value,
                      controller: _authController.oneDayPhoneNumber,
                      cursorColor: Constants.primaryColor,
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        counterText: "",
                        labelText: "Mobile number",
                        hintStyle: GoogleFonts.rajdhani(color: Colors.grey),
                        labelStyle: GoogleFonts.rajdhani(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.phone_in_talk_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Obx(
                () => _authController.otpSending.value
                    ? CustomButton.primaryProgressButton()
                    : _authController.otpSent.value
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              _authController.sendOtp();
                            },
                            child: CustomButton.primaryButton("GET OTP"),
                          ),
              ),
              SizedBox(height: 3.h),
              Obx(
                () => _authController.otpSent.value
                    ? _otpWidget(_authController.oneDayOtp)
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpWidget(TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
      width: 100.w,
      child: Column(
        children: [
          Text(
            "Enter the OTP sent on your registered mobile number",
            style: GoogleFonts.rajdhani(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.5.h),
          Container(
            width: 100.w,
            decoration: const BoxDecoration(
              color: Color(0xffF4F3F1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextFormField(
              controller: controller,
              cursorColor: Constants.primaryColor,
              maxLength: 6,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              style: GoogleFonts.rajdhani(
                letterSpacing: 30,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: "",
                label: Center(
                  child: Text(
                    "OTP",
                    style: GoogleFonts.rajdhani(),
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: GoogleFonts.rajdhani(color: Colors.grey),
                labelStyle: GoogleFonts.rajdhani(color: Colors.grey),
                border: InputBorder.none,
                // prefixIcon: const Icon(Icons.phone_in_talk_sharp),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Obx(
            () => _authController.otpVerifying.value
                ? CustomButton.primaryProgressButton()
                : InkWell(
                    onTap: () {
                      _authController.verifyOtp();
                    },
                    child: CustomButton.primaryButton("LOGIN"),
                  ),
          ),
        ],
      ),
    );
  }
}
