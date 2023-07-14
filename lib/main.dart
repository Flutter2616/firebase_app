import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/firebase_options.dart';
import 'package:firebaseapp/view/home_screen.dart';
import 'package:firebaseapp/view/singin_screen.dart';
import 'package:firebaseapp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => Splashscreen(),
          'singin':(p0) => Signinscreen(),
          'home':(p0) => Homescreen(),
        },
      ),
    ),
  );
}
