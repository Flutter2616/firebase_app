import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/firebase_options.dart';
import 'package:firebaseapp/utils/notification_service.dart';
import 'package:firebaseapp/view/ads_screen.dart';
import 'package:firebaseapp/view/home_screen.dart';
import 'package:firebaseapp/view/add_screen.dart';
import 'package:firebaseapp/view/otp_screen.dart';
import 'package:firebaseapp/view/phone_login.dart';
import 'package:firebaseapp/view/signin_screen.dart';
import 'package:firebaseapp/view/signup_screen.dart';
import 'package:firebaseapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();
  Notificationservice.service.initNotification();
  runApp(

    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'phone',
        routes: {
          '/':(p0) => Splashscreen(),
          'ads':(p0) => Adsscreen(),
          'signin':(p0) => Signinscreen(),
          'signup':(p0) => Signupscreen(),
          'home':(p0) => Homescreen(),
          'add':(p0) => Readscreen(),
          'phone':(p0) => Phonelogin(),
          'otp':(p0) => Otpscreen(),
        },
      ),
    ),
  );
}
