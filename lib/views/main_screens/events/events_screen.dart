import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.5.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.compare,
                      size: 20.sp,
                      color: Constants.primaryColor,
                    ),
                    SizedBox(width: 2.5.w),
                    Text(
                      "Events",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's get started with some competition.!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.w),
              Expanded(
                child: FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection("events").get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return eventsError("Error fetching Events for now..!");
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index];
                              return Column(
                                children: [
                                  singleEventTile(data),
                                  SizedBox(height: 2.5.w),
                                ],
                              );
                            });
                      } else {
                        return eventsError(
                            "No any Events available for now..!");
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
        ),
      ),
    );
  }

  Widget singleEventTile(var data) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.w),
      decoration: BoxDecoration(
        color: Constants.accountLightGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.5.w),
          topRight: Radius.circular(15.w),
          // bottomLeft: Radius.circular(10.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.5.w),
                topRight: Radius.circular(15.w),
                // bottomLeft: Radius.circular(10.w),
              ),
              image: DecorationImage(
                image: NetworkImage(data['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 2.5.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "24/02/2024",
                      style: GoogleFonts.rajdhani(
                        color: Constants.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      data['title'] ?? "",
                      style: GoogleFonts.rajdhani(
                        color: Constants.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      data['category'] ?? "",
                      style: GoogleFonts.rajdhani(
                        color: Constants.primaryColor.withOpacity(0.5),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.w),
                  // decoration: BoxDecoration(
                  //   color: Constants.primaryColor,
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(2.5.w),
                  //     topRight: Radius.circular(5.w),
                  //     bottomLeft: Radius.circular(10.w),
                  //   ),
                  // ),
                  // child: Text(
                  //   "Visit",
                  //   style: GoogleFonts.rajdhani(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget eventsError(String message) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.rajdhani(
          color: Constants.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
