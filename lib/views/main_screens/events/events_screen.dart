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
            children: [
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
      height: 300,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.w),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.w),
          topRight: Radius.circular(10.w),
          bottomLeft: Radius.circular(10.w),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data['image']),
              ),
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
