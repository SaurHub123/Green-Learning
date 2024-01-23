import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/utils/functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AllSubjectPanel extends StatefulWidget {
  final String careerKey;
  final ScrollController sc;
  final PanelController panelController;

  const AllSubjectPanel({
    Key? key,
    required this.sc,
    required this.panelController,
    required this.careerKey,
  }) : super(key: key);

  @override
  State<AllSubjectPanel> createState() => _AllSubjectPanelState();
}

class _AllSubjectPanelState extends State<AllSubjectPanel> {
  final MainApplicationController _mainApplicationController = Get.find();
  List<Color> randomColorList = [
    const Color(0xFFD8F3DC).withOpacity(0.4), // green
    const Color(0xFF8367C7).withOpacity(0.4), // violet
    const Color(0xFFFF5900).withOpacity(0.4), // orange
    const Color(0xFFA2D2FF).withOpacity(0.4), // blue
    const Color(0xFFFDC5F5).withOpacity(0.4), // pink
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.sc,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 1.5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              buildDragHandle(),
              InkWell(
                onTap: () {
                  widget.panelController.close();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ), // 1.h
        SizedBox(height: 1.5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.35.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Text(
                  _mainApplicationController.selectedTrack.value,
                  style: GoogleFonts.rajdhani(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Constants.primaryColor,
                  ),
                );
              }),
              SizedBox(height: 2.5.w),
              Obx(() {
                return SizedBox(
                  height: 60.h,
                  width: 100.w,
                  child: _mainApplicationController.selectedTrack.value.isEmpty
                      ? const SizedBox()
                      : FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection(widget.careerKey)
                              .doc(_mainApplicationController
                                  .selectedTrack.value)
                              .collection(_mainApplicationController
                                  .selectedTrack.value)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          subjectTile(
                                            index,
                                            snapshot.data!.docs[index]['title'],
                                          ),
                                          // SizedBox(height: 2.5.w),
                                        ],
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Constants.primaryColor,
                                ),
                              );
                            }
                          },
                        ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }

  Widget subjectTile(int index, String title) {
    return Container(
      height: 200,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.w),
      ),
      child: Row(
        children: [
          Container(
            height: 200,
            width: 10.w,
            padding:
                index == 0 ? const EdgeInsets.only(top: 20) : EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? Colors.green : Colors.grey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2.5,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.5.w),
          Expanded(
            child: Container(
              height: 180,
              padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5.w),
                // color: const Color(0xFFD8F3DC).withOpacity(0.5),
                color: randomColorList[
                    Functions.generateRandomNumber(0, randomColorList.length)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_lesson_outlined,
                            color: Colors.black,
                            size: 15.sp,
                          ),
                          SizedBox(width: 1.5.w),
                          Text(
                            "3 Hours",
                            style: GoogleFonts.rajdhani(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "View all",
                            style: GoogleFonts.rajdhani(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 1.5.w),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 13.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.w),
                  Text(
                    title,
                    style: GoogleFonts.rajdhani(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDragHandle() {
    return GestureDetector(
      onTap: () {
        widget.panelController.close();
        _mainApplicationController.selectedTrack.value = "";
      },
      child: Center(
        child: Container(
          width: 30,
          height: 0.65.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  void togglePanel() => widget.panelController.isPanelOpen
      ? widget.panelController.close()
      : widget.panelController.open();
}
