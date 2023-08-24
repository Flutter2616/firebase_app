import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign in screen",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(height: 10),
                TextField(
                  controller: txtemail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text("Email")),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: txtpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text("Password")),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String msg = await FirebaseHalper.fire
                            .id_login(txtemail.text, txtpassword.text);
                        Get.snackbar('$msg', '',
                            colorText: msg == "success"
                                ? Colors.green.shade500
                                : Colors.white,
                            backgroundColor: msg == "success"
                                ? Colors.white
                                : Colors.red.shade500);

                        if (msg == "success") {
                          Get.offAllNamed("home");
                        }
                      },
                      child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        String msg =
                            await FirebaseHalper.fire.anonymous_login();
                        Get.snackbar('$msg', '',
                            colorText: Colors.green.shade500,
                            backgroundColor: msg == "success"
                                ? Colors.white
                                : Colors.red.shade500);

                        if (msg == "success") {
                          Get.offAllNamed("home");
                        }
                      },
                      child: Text("Guest login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(onTap: () async {
                  String msg=await FirebaseHalper.fire.signin_google();
                  Get.snackbar('$msg', '',
                      colorText: Colors.green.shade500,
                      backgroundColor: msg == "success"
                          ? Colors.white
                          : Colors.red.shade500);

                  if (msg == "success") {
                    Get.offAllNamed("home");
                  }
                },
                  child: Image.asset(
                    "assets/logo.png",
                    height: 10.w,
                    width: 10.w,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("I have not account"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('signup');
                      },
                      child: Text("Create account")),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
