import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_learning/views/main_screens/account/account_screen.dart';
import 'package:green_learning/views/main_screens/courses/courses_screen.dart';
import 'package:green_learning/views/main_screens/dashboard/dashboard_screen.dart';
import 'package:green_learning/views/main_screens/events/events_screen.dart';

class MainApplicationController extends GetxController {
  var bottomNavIdx = 0.obs;

  List<Widget> bottomPages = [
    const DashboardScreen(),
    const CoursesScreen(),
    const EventsScreen(),
    const AccountScreen(),
  ];

  // Course Screen
  var selectedFaq = 0.obs;
}
