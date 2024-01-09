import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_learning/views/one_day_access/account/account_screen.dart';
import 'package:green_learning/views/one_day_access/courses/courses_screen.dart';
import 'package:green_learning/views/one_day_access/dashboard/dashboard_screen.dart';
import 'package:green_learning/views/one_day_access/events/events_screen.dart';

class MainApplicationController extends GetxController {
  var bottomNavIdx = 0.obs;

  List<Widget> bottomPages = [
    const DashboardScreen(),
    const CoursesScreen(),
    const EventsScreen(),
    const AccountScreen(),
  ];
}
