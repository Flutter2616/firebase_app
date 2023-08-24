import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up screen",
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
              ElevatedButton(
                onPressed: () async {
                  String msg = await FirebaseHalper.fire
                      .id_register(txtemail.text, txtpassword.text);
                  Get.snackbar('$msg', '',
                      colorText: Colors.black,
                      backgroundColor: msg == "success"
                          ? Colors.green
                          : Colors.red.shade500);

                  if (msg == "success") {
                    Get.offAllNamed("signin");
                  }
                },
                child: Text("Register",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("I have account"),
                TextButton(
                    onPressed: () {
                      Get.toNamed('signin');
                    },
                    child: Text("login!")),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
