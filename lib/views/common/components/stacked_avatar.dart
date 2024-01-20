import 'package:flutter/material.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StackedAvatar {
  static Widget simpleAvatar() {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.primaryColor,
              width: 6.sp,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(3.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/avt1.png"),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Constants.primaryColor,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
