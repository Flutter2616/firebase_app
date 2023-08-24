import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/modal/product_modal.dart';
import 'package:firebaseapp/modal/user_modal.dart';
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
  Usermodal? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseHalper.fire.user_detail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        drawer: Drawer(
            width: 60.w,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 50.sp,
                      backgroundImage: AssetImage("assets/logo.png")),
                  const SizedBox(height: 8),
                  Text("${user!.name ?? "User"}",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp)),
                  const SizedBox(height: 8),
                  Text("${user!.email ?? "not verified"}",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp)),
                  const SizedBox(height: 8),
                  Text("${user!.number ?? "not verified number"}",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseHalper.fire.user_logout();
                      Get.offAllNamed('signin');
                    },
                    child: Text("Log out",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                  )
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('add', arguments: {"status": 0, "product": null});
            },
            child: Icon(Icons.add, color: Colors.white, size: 18.sp),
            backgroundColor: Colors.blue),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: Text(
              "Product",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextFormField()
            ],
          ),
        ),
      ),
    );
  }
}
