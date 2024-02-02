import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
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
  var savingUser = false.obs;
  var checkingName = false.obs;

  TextEditingController oneDayPhoneNumber = TextEditingController();
  TextEditingController oneDayOtp = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveUser() async {
    try {
      var user = await FirebaseFirestore.instance
          .collection("users")
          .doc(oneDayPhoneNumber.text)
          .get();


      user.set({
        'fullName': fullNameController.text,
        'email': emailController.text,
        'houseNo': houseNoController.text,
        'streetNo': streetNoController.text,
        'state': stateController.text,
        'country': countryController.text,
        'college': collegeNameController.text,
        'course': courseController.text,
      });
      savingUser.value =true;
    } catch (e) {
      log(e.toString());
      savingUser.value=false;
    }
  }

  Future<void> checkUserName() async{

    try {
      var user = await FirebaseFirestore.instance.collection("user").doc(oneDayPhoneNumber.text).get();
      
      if(user.data().containsKey('name')){
        Get.offAll(() => DashboardScreen());
      }else{
        Get.offAll(() => RegistrationScreen());
      }
      checkingName.value=true;
    } catch (e) {
      checkingName.value=false;
    }

  }

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
    }
  }

  Future<void> verifyOtp() async {
    otpVerifying.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: vId,
        smsCode: oneDayOtp.text,
      );

      await _auth.signInWithCredential(credential);
      await checkUserExistence();
    } catch (e) {
      otpVerifying.value = false;
    }
  }

  // Registration Screen
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetNoController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
}
