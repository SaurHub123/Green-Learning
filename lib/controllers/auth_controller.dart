import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_learning/services/global.dart';
import 'package:green_learning/utils/constants.dart';
import 'package:green_learning/views/main_screens/main_home_screen.dart';

class AuthController extends GetxController {
  var otpSent = false.obs;
  String vId = "";
  var otpSending = false.obs;
  var otpVerifying = false.obs;

  TextEditingController oneDayPhoneNumber = TextEditingController();
  TextEditingController oneDayOtp = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkUserExistence() async {
    var db = await FirebaseFirestore.instance
        .collection("users")
        .doc(oneDayPhoneNumber.text)
        .get();

    if (db.exists) {
      Global.storageServices.setString(
        Constants.phoneNumber,
        oneDayPhoneNumber.text,
      );
      Get.offAll(() => const MainHomeScreen());
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(oneDayPhoneNumber.text)
          .set({
        "mobile_number": oneDayPhoneNumber.text,
        "timestamp": DateTime.now(),
      });
      Global.storageServices.setString(
        Constants.phoneNumber,
        oneDayPhoneNumber.text,
      );
      Get.offAll(() => const MainHomeScreen());
    }
    otpVerifying.value = false;
  }

  Future<void> sendOtp() async {
    otpSending.value = true;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91${oneDayPhoneNumber.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failed
          log(e.toString());
          otpSending.value = false;
        },
        codeSent: (String verificationId, int? resendToken) async {
          vId = verificationId;
          otpSent.value = true;
          otpSending.value = false;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
      otpSending.value = false;
      // Handle exceptions
    }
  }

  Future<void> verifyOtp() async {
    otpVerifying.value = true;
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vId,
        smsCode: oneDayOtp.text,
      );

      await _auth.signInWithCredential(credential);
      await checkUserExistence();

      // Handle successful login, for example, navigate to the next screen
    } catch (e) {
      otpVerifying.value = false;
      // Handle OTP verification failure
    }
  }
}
