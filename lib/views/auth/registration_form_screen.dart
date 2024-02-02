import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/auth_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/custom_buttons.dart';
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
  final AuthController _authController = Get.find();

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
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              details.onStepContinue!();
                            },
                            child: CustomButton.secondaryIconFilledButton(
                                Icons.next_plan_outlined, "Next"),
                          ),
                        ),
                        SizedBox(width: 2.5.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              details.onStepCancel!();
                            },
                            child: CustomButton.secondaryGreyIconFilledButton(
                                Icons.settings_backup_restore, "Cancel"),
                          ),
                        ),
                      ],
                    );
                  },
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
        title: const Text("Personal Info"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _authController.fullNameController,
              validator: (value) {
                if (value!.length < 3) {
                  return "Invalid Name";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "Full Name",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: _authController.emailController,
              validator: (value) {
                if (value!.length < 2) {
                  return "Invalid email address";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "Email",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      Step(
        title: const Text("Address"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _authController.houseNoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Invalid House Number";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "House Number",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: _authController.streetNoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Invalid Street Number";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "Street Number",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: _authController.stateController,
              validator: (value) {
                if (value!.length < 3) {
                  return "Invalid State";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "State",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: _authController.countryController,
              validator: (value) {
                if (value!.length < 4) {
                  return "Invalid Country";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "Country",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      Step(
        title: const Text("Education"),
        content: Column(
          children: [
            SizedBox(height: 0.5.h),
            TextFormField(
              controller: _authController.collegeNameController,
              validator: (value) {
                if (value!.length < 10) {
                  return "Invalid College Name";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "College Name",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
            TextFormField(
              controller: _authController.courseController,
              validator: (value) {
                if (value!.length < 2) {
                  return "Invalid Course";
                }

                return "";
              },
              decoration: InputDecoration(
                labelText: "Course",
                focusedBorder: const UnderlineInputBorder(),
                focusColor: Constants.primaryColor,
                labelStyle: GoogleFonts.rajdhani(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Constants.primaryColor,
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    ];
  }
}
