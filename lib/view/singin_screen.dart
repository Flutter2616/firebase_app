import 'package:firebaseapp/utils/firebase_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    label: Text("Email")),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black)),
                    label: Text("Password")),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text("Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String msg = await FirebaseHalper.fire.anonymous_login();
                  Get.snackbar('$msg', '',colorText: Colors.green.shade500,
                      backgroundColor: msg == "success"
                          ? Colors.white
                          : Colors.red.shade500);

                  if(msg=="success")
                    {
                      Get.offAllNamed("home");
                    }
                },
                child: Text("Guest login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
