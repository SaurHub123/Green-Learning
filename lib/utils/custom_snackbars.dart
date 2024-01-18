import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBars {
  /// failure
  static SnackBar failureSnackBar(String message) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: message.isEmpty
            ? 'You have failed to read this failure message.\nPlease try again!'
            : "",
        contentType: ContentType.failure,
      ),
    );
  }

  /// help
  static SnackBar helpSnackBar(String message) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Hi There!',
        message: message.isEmpty
            ? 'You need to use this package in the app to uplift your Snack bar Experience!'
            : "",
        contentType: ContentType.help,
      ),
    );
  }

  /// success
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Congratulation!',
        message: message.isEmpty
            ? 'You have successfully read this message.\nPlease continue working!'
            : "hellow",
        contentType: ContentType.success,
      ),
    );
  }

  /// warning
  static var warningSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Warning!',
      message: 'You Have a warning for this message.\nPlease read carefully!',
      contentType: ContentType.warning,
    ),
  );
}
