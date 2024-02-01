import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationFormScreen extends StatefulWidget {
  final bool update;

  const RegistrationFormScreen({
    super.key,
    required this.update,
  });

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Constants.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 2.5.w),
                    Expanded(
                      child: Text(
                        widget.update ? "Update Profile" : "Registration",
                        style: GoogleFonts.rajdhani(
                          color: Constants.primaryColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: Stepper(
                  steps: getSteps(),
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  },
                  currentStep: _currentStep,
                  onStepContinue: () {
                    final isLastStep = _currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Form Submitted"),
                            content: const Text(
                                "Your Form Has been submitted Successfully"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      setState(() {
                        _currentStep++;
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        title: Text("Name"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _firstnameController,
              decoration: const InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(),
              ),

            ),


            SizedBox(height: 2.h),
            TextFormField(
              controller: _lastnameController,
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),

            )

          ],
        ),
      ),
      Step(
        title: const Text("Email"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      Step(
        title: const Text("Phone Number Field"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    ];
  }
}
