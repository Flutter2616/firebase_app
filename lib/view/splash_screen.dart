import 'dart:async';

import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool user=false;
  @override
  void initState()  {
    super.initState();
    user= FirebaseHalper.fire.check_user();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => user==false?Get.offAllNamed('signin'):Get.offAllNamed('home'));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(size: 50.w),
        ),
      ),
    );
  }
}
