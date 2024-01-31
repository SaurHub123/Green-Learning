import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/controllers/main_application_controller.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../../../../utils/functions.dart';

class MainResourcesScreen extends StatefulWidget {
  final String careerKey;
  final String subjectName;

  const MainResourcesScreen({
    super.key,
    required this.careerKey,
    required this.subjectName,
  });

  @override
  State<MainResourcesScreen> createState() => _MainResourcesScreenState();
}

class _MainResourcesScreenState extends State<MainResourcesScreen> {
  final MainApplicationController _mainApplicationController = Get.find();

  @override
  Widget build(BuildContext context) {
    var resourceData = [
      {
        "name": "Websites",
        "screen": youtubeResourceScreen(),
      },
      {
        "name": "Notes",
        "screen": youtubeResourceScreen(),
      },
      {
        "name": "Youtube",
        "screen": youtubeResourceScreen(),
      },
      {
        "name": "Courses",
        "screen": youtubeResourceScreen(),
      }
    ];
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Row(
          children: [
            Container(
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              color: const Color(0xFFF1F1F1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: AppBar().preferredSize.height),
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        menuTile(0, "Websites"),
                        menuTile(1, "Notes"),
                        menuTile(2, "Youtube"),
                        menuTile(3, "Courses"),
                      ],
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            SizedBox(
              width: 20,
              height: 100.h,
            ),
            Expanded(
              child: Obx(
                () => _mainApplicationController.selectedMenu.value == 2 ||
                        _mainApplicationController.selectedMenu.value == 3
                    ? youtubeResourceScreen()
                    : notesResourceScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notesResourceScreen() {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection(widget.careerKey)
                  .doc(_mainApplicationController.selectedTrack.value)
                  .collection(_mainApplicationController.selectedTrack.value)
                  .doc(widget.subjectName)
                  .collection(
                      _mainApplicationController.selectedMenuString.value)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "No any Content for now!",
                      style: GoogleFonts.rajdhani(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          return InkWell(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            onTap: () {},
                            child: singleNotesResourceTile(data),
                          );
                        });
                  } else {
                    return Center(
                      child: Text(
                        "No any Content for now!",
                        style: GoogleFonts.rajdhani(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
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
        ],
      ),
    );
  }

  List<Color> randomColorList = [
    const Color(0xFFD8F3DC).withOpacity(0.4), // green
    const Color(0xFF8367C7).withOpacity(0.4), // violet
    const Color(0xFFFF5900).withOpacity(0.4), // orange
    const Color(0xFFA2D2FF).withOpacity(0.4), // blue
    const Color(0xFFFDC5F5).withOpacity(0.4), // pink
    const Color(0xFFE19578).withOpacity(0.4), // pink
  ];

  Widget singleNotesResourceTile(var data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            if (data['link'] != null) {
              launcher.launchUrl(
                Uri.parse(data['link']),
                mode: launcher.LaunchMode.externalApplication,
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: randomColorList[
                  Functions.generateRandomNumber(0, randomColorList.length)],
              borderRadius: BorderRadius.circular(1.5.w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5.w),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/notes.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            data['name'] ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rajdhani(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.w),
      ],
    );
  }

  Widget youtubeResourceScreen() {
    return Container(
      height: 100.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection(widget.careerKey)
                .doc(_mainApplicationController.selectedTrack.value)
                .collection(_mainApplicationController.selectedTrack.value)
                .doc(widget.subjectName)
                .collection(_mainApplicationController.selectedMenuString.value)
                .orderBy('order')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "No any Content for now!",
                    style: GoogleFonts.rajdhani(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {},
                          child: singleYoutubeResourceTile(data),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "No any Content for now!",
                      style: GoogleFonts.rajdhani(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
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
          )),
        ],
      ),
    );
  }

  Widget singleYoutubeResourceTile(var data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            if (data['link'] != null) {
              launcher.launchUrl(
                Uri.parse(data['link']),
                mode: launcher.LaunchMode.externalApplication,
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: randomColorList[
                  Functions.generateRandomNumber(0, randomColorList.length)],
              borderRadius: BorderRadius.circular(1.5.w),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.5.w),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/youtube.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            data['name'] ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rajdhani(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            data['channel'] ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.rajdhani(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.w),
      ],
    );
  }

  Widget singleYoutubeResourceTiles(var data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.w),
            image: const DecorationImage(
              image: AssetImage(
                "assets/images/youtube.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 2.5.w),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'] ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.rajdhani(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data['channel'] ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.rajdhani(
                      color: Colors.black54,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (data['link'] != null) {
                  launcher.launchUrl(
                    Uri.parse(data['link']),
                    mode: launcher.LaunchMode.externalApplication,
                  );
                }
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 4.5.w, vertical: .5.w),
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(.5.w),
                ),
                child: Text(
                  "Visit",
                  style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5.w),
      ],
    );
  }

  Widget menuTile(int index, String title) {
    return Obx(() {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          _mainApplicationController.selectedMenu.value == index
              ? Positioned(
                  top: 0,
                  right: -25,
                  bottom: 0,
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(100.sp),
                    ),
                  ),
                )
              : const SizedBox(),
          InkWell(
            onTap: () {
              _mainApplicationController.selectedMenu.value = index;
              _mainApplicationController.selectedMenuString.value =
                  title.toLowerCase();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.w),
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rajdhani(
                        color: _mainApplicationController.selectedMenu.value ==
                                index
                            ? Constants.primaryColor
                            : Colors.black,
                        fontWeight:
                            _mainApplicationController.selectedMenu.value ==
                                    index
                                ? FontWeight.bold
                                : FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                _mainApplicationController.selectedMenu.value == index
                    ? Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.primaryColor,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      );
    });
  }
}
