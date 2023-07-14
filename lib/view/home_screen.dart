import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.green.shade500,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor: Colors.white,
                    child: Icon(Icons.done,
                        size: 25.sp, color: Colors.green.shade500),
                    radius: 30.sp),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseHalper.fire.user_logout();
                    Get.offAllNamed('singin');
                  },
                  child: Text("Signout", style: TextStyle(color: Colors.white)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
