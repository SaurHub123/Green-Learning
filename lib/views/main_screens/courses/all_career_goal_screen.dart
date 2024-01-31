import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/Animations/fade_animations.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/common/components/custom_cards.dart';
import 'package:green_learning/views/main_screens/courses/all_subject_panel.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AllCareerGoalScreen extends StatefulWidget {
  final String careerKey;
  final String careerTitle;

  const AllCareerGoalScreen(
      {super.key, required this.careerKey, required this.careerTitle});

  @override
  State<AllCareerGoalScreen> createState() => _AllCareerGoalScreenState();
}

class _AllCareerGoalScreenState extends State<AllCareerGoalScreen> {
  final panelController = PanelController();
  final MainApplicationController _mainApplicationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        MaterialCommunityIcons.arrow_left,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      widget.careerTitle,
                      style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    SlidingUpPanel(
                      controller: panelController,
                      minHeight: 0,
                      isDraggable: false,
                      maxHeight: 70.h,
                      parallaxEnabled: false,
                      parallaxOffset: 0.1,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18.0),
                      ),
                      body: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection(widget.careerKey)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.docs.isNotEmpty) {
                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data!.docs[index];
                                      return InkWell(
                                        onTap: () {
                                          _mainApplicationController
                                              .selectedTrack
                                              .value = data["title"];
                                          panelController.open();
                                        },
                                        child: Column(
                                          children: [
                                            CustomCards.singleTrackCard(
                                              data["title"],
                                              data["description"],
                                              "klo",
                                            ),
                                            SizedBox(height: 2.5.w),
                                            snapshot.data!.docs.length - 1 ==
                                                    index
                                                ? SizedBox(height: 15.h)
                                                : const SizedBox(),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return Center(
                                  child: Text(
                                    "No Any content for now.!",
                                    style: GoogleFonts.rajdhani(
                                      color: Constants.primaryColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Constants.primaryColor,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      panelBuilder: (sc) => AllSubjectPanel(
                        careerKey: widget.careerKey,
                        sc: sc,
                        panelController: panelController,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget slidingPanel() {
    return Container();
  }
}
